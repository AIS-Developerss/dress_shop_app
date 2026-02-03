# Контракт для бэкенда (gRPC)

Приложение ожидает API по **gRPC**. Контракт описан в proto-файле.

---

## Информация для бэкендеров

### 1. **Proto-файл (обязательно)**

**`proto/api.proto`**

В нём описаны:

- **Сообщения** (User, Product, Category, Order, Favorite и т.д.) — поля и типы.
- **Сервисы и RPC**:
  - `AuthService` — SendSms, VerifySms, Register
  - `ProductService` — GetProducts, GetProduct
  - `CategoryService` — GetCategories
  - `FavoriteService` — GetFavorites, AddFavorite, RemoveFavorite
  - `OrderService` — CreateOrder, GetOrders, GetOrder
  - `ContactService` — SendContactMessage

Бэкенд по этому файлу генерирует серверный код (Go, Java, C#, Python и т.д.) и реализует эти методы. **Имена сервисов, методов и полей менять нельзя** — иначе клиент (Flutter) не совпадёт.

**Package в proto:** `dress_shop.v1`  
Пути RPC в gRPC выглядят так: `/dress_shop.v1.AuthService/SendSms`, `/dress_shop.v1.ProductService/GetProducts` и т.д.

---

### 2. **API-документация (рекомендуется)**

**`API_DOCUMENTATION.md`**

Там по-человечески расписано:

- что делает каждый метод (логика, коды ошибок);
- примеры полей (например, статусы заказа: pending, confirmed, shipped и т.д.);
- требования к авторизации (Bearer-токен в metadata).

Бэкенд может ориентироваться на эту документацию по смыслу; по формату запросов/ответов — строго на **proto**.

---

## Авторизация в gRPC

Клиент передаёт JWT в **metadata** каждого запроса (кроме SendSms, VerifySms, Register, SendContactMessage — по договорённости):

- Ключ: `authorization`
- Значение: `Bearer <token>`

Сервер должен проверять этот заголовок для защищённых RPC.

---

## Кратко для бэкенда

1. Взять **`proto/api.proto`**.
2. Сгенерировать серверный код под свой стек (protoc + плагин для Go/Java/C#/…).
3. Реализовать все RPC из proto; логику и коды ошибок сверить с **`API_DOCUMENTATION.md`**.
4. Для методов, требующих авторизации, читать `authorization: Bearer <token>` из metadata.

После этого клиент (Flutter) подключается к вашему хосту:порт и работает без изменений в коде.
