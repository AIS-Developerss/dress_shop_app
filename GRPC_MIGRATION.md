# Миграция на gRPC — что переписать

Сейчас приложение использует **REST (HTTP + JSON)** через `ApiService` и моки через `MockApiService`. При переходе на gRPC меняется только слой общения с бэкендом; UI и провайдеры можно оставить почти без изменений.

**Реализовано:** добавлены proto-файлы, сгенерированный gRPC-код, `GrpcApiService`, интерфейс `ApiClient` и внедрение через Provider. По умолчанию используется `MockApiService`; переключение на gRPC — в `main.dart` (см. ниже).

---

## 1. Что нужно сделать (кратко)

| Что                       | Действие                                                                                 |
| ------------------------- | ---------------------------------------------------------------------------------------- |
| **Proto-файлы**           | Описать сервисы и сообщения (новые файлы)                                                |
| **Генерация кода**        | Добавить зависимости, настроить `protoc` и генерировать Dart из `.proto`                 |
| **Слой API**              | Переписать `ApiService` → gRPC-клиент, сохранив **тот же интерфейс** методов             |
| **Провайдеры и страницы** | Не переписывать: они вызывают те же методы (`sendSms`, `getProducts`, и т.д.)            |
| **Модели**                | Оставить `Product`, `Order`, `User` и т.д.; в gRPC-сервисе только маппинг proto ↔ модели |

---

## 2. Что переписать по файлам

### 2.1. Новое (добавить)

- **`proto/`** — папка с `.proto` файлами (или один общий `api.proto`):

  - Auth: `SendSms`, `VerifySms`, `Register`
  - Products: `GetProducts`, `GetProduct`
  - Categories: `GetCategories`
  - Favorites: `GetFavorites`, `AddFavorite`, `RemoveFavorite`
  - Orders: `CreateOrder`, `GetOrders`, `GetOrder`
  - Contact: `SendContactMessage`

- **Сгенерированный код** — например `lib/generated/` (генерируется из proto, в репозиторий можно коммитить или генерировать в CI).

- **`lib/services/grpc_api_service.dart`** — реализация того же набора методов, что у `ApiService`/`MockApiService`, но внутри вызовы gRPC и маппинг:
  - proto-ответы → ваши модели (`Product`, `Order`, `User`, …);
  - ваши модели / параметры → proto-запросы.

### 2.2. Переписать

- **`lib/services/api_service.dart`**  
  Сейчас: HTTP-клиент (`http.get`, `http.post`).  
  При gRPC: либо удалить этот файл и везде использовать `GrpcApiService`, либо оставить один общий интерфейс (абстрактный класс/интерфейс), а реализацией сделать gRPC.

### 2.3. Оставить как есть (только подменить реализацию)

- **`lib/models/`** — все модели (`product.dart`, `order.dart`, `user.dart`, `category.dart`, `favorite.dart`) не трогать.
- **`lib/providers/`** — `AuthProvider`, `ProductsProvider`, `FavoritesProvider`, `OrdersProvider` не переписывать; только заменить `MockApiService()` на ваш gRPC-сервис (или инжектить один интерфейс).
- **`lib/pages/`** — страницы не трогать, они работают через провайдеры.
- **`lib/services/mock_api_service.dart`** — можно оставить для локальной разработки без бэкенда.

---

## 3. Интерфейс, который должен сохраниться

Чтобы ни провайдеры, ни страницы не переписывать, gRPC-сервис должен реализовать те же методы с теми же сигнатурами:

```dart
// Условный интерфейс (можно вынести в abstract class или использовать как контракт)
Future<Map<String, dynamic>> sendSms(String phone);
Future<Map<String, dynamic>> verifySms(String phone, String code);
Future<Map<String, dynamic>> register(String name, String phone);
Future<List<Product>> getProducts({String? categoryId, String? search});
Future<Product?> getProduct(String id);
Future<List<Category>> getCategories();
Future<List<Favorite>> getFavorites(String userId);
Future<Favorite> addFavorite(String userId, String productId);
Future<bool> removeFavorite(String favoriteId);
Future<Order> createOrder({...});
Future<List<Order>> getOrders(String userId);
Future<Order?> getOrder(String id);
Future<Map<String, dynamic>> sendContactMessage({required String name, required String phone, required String message});
```

Внутри `GrpcApiService` вы будете вызывать gRPC-стабы и преобразовывать ответы в эти типы.

---

## 4. Зависимости и генерация кода

В `pubspec.yaml` уже добавлены `grpc`, `protobuf` и `protoc_plugin`.

**Регенерация Dart из proto** (если меняли `proto/api.proto`):

1. Установить `protoc`: `winget install Google.Protobuf`
2. Установить плагин: `dart pub global activate protoc_plugin`
3. Добавить в PATH: `%LOCALAPPDATA%\Pub\Cache\bin`
4. Запустить скрипт: `.\scripts\generate_grpc.ps1` (из корня проекта)

Или вручную: `protoc --dart_out=grpc:lib/generated -I proto proto/api.proto`

---

## 5. Где подменять реализацию

В `main.dart` задаётся одна реализация `ApiClient` и передаётся провайдерам:

```dart
// Моки (по умолчанию):
final ApiClient apiClient = MockApiService();

// gRPC (когда бэкенд готов):
// final ApiClient apiClient = GrpcApiService(host: 'your-server.com', port: 50051);
```

Провайдеры получают `apiClient` через `context.read<ApiClient>()` при создании.

---

## 6. Итог

- **Переписать:** только слой доступа к API (текущий HTTP `ApiService` → gRPC-клиент с тем же набором методов) и добавить proto + генерацию.
- **Не переписывать:** модели, провайдеры, страницы, если сохранить прежний интерфейс методов и подменять реализацию (mock → gRPC) в одном месте.

Если нужно, могу предложить структуру `.proto` под твой текущий API и пример `GrpcApiService` с маппингом для одного-двух методов (например, auth и products).
