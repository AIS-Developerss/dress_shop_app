# Инструкция по переключению с моков на реальный API

Переключение делается **в одном месте** — в `lib/main.dart`. Провайдеры получают общий `ApiClient`; менять их или страницы не нужно.

---

## Вариант 1: Переключение на gRPC

Когда бэкенд отдаёт API по gRPC (см. `proto/api.proto`):

### Шаг 1. Раскомментировать импорт

В `lib/main.dart`:

```dart
// Было:
// import 'services/grpc_api_service.dart'; // для gRPC: раскомментировать и использовать ниже

// Стало:
import 'services/grpc_api_service.dart';
```

### Шаг 2. Подставить GrpcApiService вместо MockApiService

В `lib/main.dart` в методе `build` класса `MyApp`:

```dart
// Было:
final ApiClient apiClient = MockApiService();

// Стало (подставьте свой хост и порт):
final ApiClient apiClient = GrpcApiService(
  host: 'your-server.com',   // адрес gRPC-сервера (или localhost для локальной разработки)
  port: 50051,                // порт (50051 — типичный для gRPC)
  useTls: false,              // true, если сервер по TLS/HTTPS
);
```

Пример для локального сервера:

```dart
final ApiClient apiClient = GrpcApiService(
  host: 'localhost',
  port: 50051,
  useTls: false,
);
```

Готово. Токен после входа уже передаётся в gRPC (через `setToken` в `AuthProvider`).

---

## Вариант 2: Переключение на REST (HTTP + JSON)

Если бэкенд отдаёт REST API (как в `API_DOCUMENTATION.md`), нужно:

1. **Реализовать в `ApiService` интерфейс `ApiClient`**  
   В `lib/services/api_service.dart` сделать `class ApiService extends ApiClient` и добавить `@override` ко всем методам (сигнатуры уже совпадают). При необходимости добавить туда же `setToken` и использование токена в заголовках.

2. **Переключить в `main.dart`:**

```dart
import 'services/api_service.dart';

// В build():
final ApiClient apiClient = ApiService(baseUrl: 'https://your-api-domain.com/api');
```

Провайдеры и страницы менять не нужно — они работают с `ApiClient`.

---

## Проверка после переключения

После переключения на реальный API (gRPC или REST) проверьте:

- Регистрация и вход (SMS, верификация, токен)
- Список товаров и категорий
- Поиск и фильтр по категориям
- Избранное (добавить/удалить)
- Корзина и оформление заказа
- История заказов
- Форма «Связь с нами»

---

## Важные замечания

1. **gRPC**: Бэкенд должен реализовывать те же сервисы и RPC, что в `proto/api.proto`. Пути вида `/dress_shop.v1.AuthService/SendSms` и т.п.

2. **Токен**: После успешного входа токен передаётся в API через `setToken` (gRPC — в metadata, REST — в заголовке `Authorization`).

3. **Ошибки**: Реальный API может возвращать ошибки и таймауты. При необходимости добавьте обработку в провайдерах или в `GrpcApiService`/`ApiService`.

4. **Конфиг**: Хост/порт или baseUrl можно вынести в конфиг или переменные окружения, а в `main.dart` только подставлять их в `GrpcApiService(...)` или `ApiService(...)`.

---

## Дополнительно: gRPC и proto

- Описание API: `proto/api.proto`
- Регенерация Dart-кода после изменений proto: `.\scripts\generate_grpc.ps1` (см. `GRPC_MIGRATION.md`)
