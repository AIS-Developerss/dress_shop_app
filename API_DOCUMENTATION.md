# API Документация для Dress Shop App

> **Для бэкенда (gRPC):** контракт — в **`proto/api.proto`**. Что передать бэкендерам и как подключаться — см. **`BACKEND_CONTRACT.md`**. Ниже — описание логики и полей в удобочитаемом виде (REST-формат для справки).

## Базовый URL (REST; для gRPC см. proto)

```
https://your-api-domain.com/api
```

## Аутентификация

Все запросы, кроме регистрации и отправки SMS, требуют заголовок:

```
Authorization: Bearer {token}
```

---

## 1. Авторизация и Регистрация

### 1.1. Регистрация

**POST** `/auth/register`

**Request Body:**

```json
{
  "name": "Иван Иванов",
  "phone": "+79991234567"
}
```

**Response:**

```json
{
  "success": true,
  "message": "Registration successful, SMS sent"
}
```

### 1.2. Отправка SMS кода

**POST** `/auth/send-sms`

**Request Body:**

```json
{
  "phone": "+79991234567"
}
```

**Response:**

```json
{
  "success": true,
  "message": "SMS sent"
}
```

### 1.3. Проверка SMS кода

**POST** `/auth/verify-sms`

**Request Body:**

```json
{
  "phone": "+79991234567",
  "code": "1234"
}
```

**Response:**

```json
{
  "success": true,
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "user_123",
    "name": "Иван Иванов",
    "phone": "+79991234567",
    "email": null
  }
}
```

---

## 2. Товары

### 2.1. Получить список товаров

**GET** `/products?categoryId={categoryId}&search={search}`

**Query Parameters:**

- `categoryId` (optional) - ID категории для фильтрации
- `search` (optional) - Поисковый запрос

**Response:**

```json
{
  "products": [
    {
      "id": "product_1",
      "name": "Air Jordans",
      "price": "14500",
      "description": "У вас есть прыжки и скорость...",
      "imagePaths": [
        "https://example.com/images/jordan1.png",
        "https://example.com/images/jordan2.png"
      ],
      "categoryId": "cat_1",
      "characteristics": {
        "Материал": "Кожа",
        "Подошва": "Резина",
        "Цвет": "Черный/Белый",
        "Вес": "350г"
      },
      "availableSizes": ["40", "41", "42", "43", "44", "45"],
      "stock": 10
    }
  ]
}
```

### 2.2. Получить товар по ID

**GET** `/products/{id}`

**Response:**

```json
{
  "product": {
    "id": "product_1",
    "name": "Air Jordans",
    "price": "14500",
    "description": "У вас есть прыжки и скорость...",
    "imagePaths": [
      "https://example.com/images/jordan1.png",
      "https://example.com/images/jordan2.png"
    ],
    "categoryId": "cat_1",
    "characteristics": {
      "Материал": "Кожа",
      "Подошва": "Резина",
      "Цвет": "Черный/Белый",
      "Вес": "350г"
    },
    "availableSizes": ["40", "41", "42", "43", "44", "45"],
    "stock": 10
  }
}
```

---

## 3. Категории

### 3.1. Получить список категорий

**GET** `/categories`

**Response:**

```json
{
  "categories": [
    {
      "id": "cat_1",
      "name": "Баскетбольные кроссовки",
      "icon": null
    },
    {
      "id": "cat_2",
      "name": "Беговые кроссовки",
      "icon": null
    }
  ]
}
```

---

## 4. Избранное

### 4.1. Получить избранное пользователя

**GET** `/favorites?userId={userId}`

**Query Parameters:**

- `userId` (required) - ID пользователя

**Response:**

```json
{
  "favorites": [
    {
      "id": "fav_1",
      "userId": "user_123",
      "productId": "product_1"
    }
  ]
}
```

### 4.2. Добавить в избранное

**POST** `/favorites`

**Request Body:**

```json
{
  "userId": "user_123",
  "productId": "product_1"
}
```

**Response:**

```json
{
  "success": true,
  "favorite": {
    "id": "fav_1",
    "userId": "user_123",
    "productId": "product_1"
  }
}
```

### 4.3. Удалить из избранного

**DELETE** `/favorites/{favoriteId}`

**Response:**

```json
{
  "success": true
}
```

---

## 5. Заказы

### 5.1. Создать заказ

**POST** `/orders`

**Request Body:**

```json
{
  "userId": "user_123",
  "items": [
    {
      "productId": "product_1",
      "productName": "Air Jordans",
      "size": "42",
      "quantity": 1,
      "price": "14500",
      "imagePath": "https://example.com/images/jordan1.png"
    }
  ],
  "deliveryAddress": "Москва, ул. Примерная, д. 1, кв. 10",
  "phone": "+79991234567",
  "name": "Иван Иванов"
}
```

**Response:**

```json
{
  "success": true,
  "order": {
    "id": "order_123",
    "userId": "user_123",
    "items": [
      {
        "productId": "product_1",
        "productName": "Air Jordans",
        "size": "42",
        "quantity": 1,
        "price": "14500",
        "imagePath": "https://example.com/images/jordan1.png"
      }
    ],
    "totalPrice": "14500.00",
    "status": "pending",
    "createdAt": "2026-01-28T12:00:00Z",
    "deliveryAddress": "Москва, ул. Примерная, д. 1, кв. 10",
    "phone": "+79991234567",
    "name": "Иван Иванов"
  }
}
```

### 5.2. Получить список заказов пользователя

**GET** `/orders?userId={userId}`

**Query Parameters:**

- `userId` (required) - ID пользователя

**Response:**

```json
{
  "orders": [
    {
      "id": "order_123",
      "userId": "user_123",
      "items": [
        {
          "productId": "product_1",
          "productName": "Air Jordans",
          "size": "42",
          "quantity": 1,
          "price": "14500",
          "imagePath": "https://example.com/images/jordan1.png"
        }
      ],
      "totalPrice": "14500.00",
      "status": "pending",
      "createdAt": "2026-01-28T12:00:00Z",
      "deliveryAddress": "Москва, ул. Примерная, д. 1, кв. 10",
      "phone": "+79991234567",
      "name": "Иван Иванов"
    }
  ]
}
```

**Статусы заказа:**

- `pending` - В обработке
- `confirmed` - Подтвержден
- `shipped` - Отправлен
- `delivered` - Доставлен
- `cancelled` - Отменен

### 5.3. Получить заказ по ID

**GET** `/orders/{id}`

**Response:**

```json
{
  "order": {
    "id": "order_123",
    "userId": "user_123",
    "items": [
      {
        "productId": "product_1",
        "productName": "Air Jordans",
        "size": "42",
        "quantity": 1,
        "price": "14500",
        "imagePath": "https://example.com/images/jordan1.png"
      }
    ],
    "totalPrice": "14500.00",
    "status": "pending",
    "createdAt": "2026-01-28T12:00:00Z",
    "deliveryAddress": "Москва, ул. Примерная, д. 1, кв. 10",
    "phone": "+79991234567",
    "name": "Иван Иванов"
  }
}
```

---

## 6. Связь с нами

### 6.1. Отправить сообщение

**POST** `/contact`

**Request Body:**

```json
{
  "name": "Иван Иванов",
  "phone": "+79991234567",
  "message": "Здравствуйте, у меня вопрос..."
}
```

**Response:**

```json
{
  "success": true,
  "message": "Message sent"
}
```

---

## Модели данных

### User

```json
{
  "id": "string",
  "name": "string",
  "phone": "string",
  "email": "string | null"
}
```

### Product

```json
{
  "id": "string",
  "name": "string",
  "price": "string",
  "description": "string",
  "imagePaths": ["string"],
  "categoryId": "string",
  "characteristics": {
    "key": "value"
  },
  "availableSizes": ["string"],
  "stock": "number"
}
```

### Category

```json
{
  "id": "string",
  "name": "string",
  "icon": "string | null"
}
```

### Favorite

```json
{
  "id": "string",
  "userId": "string",
  "productId": "string"
}
```

### OrderItem

```json
{
  "productId": "string",
  "productName": "string",
  "size": "string",
  "quantity": "number",
  "price": "string",
  "imagePath": "string"
}
```

### Order

```json
{
  "id": "string",
  "userId": "string",
  "items": [OrderItem],
  "totalPrice": "string",
  "status": "string",
  "createdAt": "string (ISO 8601)",
  "deliveryAddress": "string | null",
  "phone": "string | null",
  "name": "string | null"
}
```

---

## Коды ошибок

- `400` - Bad Request (неверные данные)
- `401` - Unauthorized (требуется авторизация)
- `404` - Not Found (ресурс не найден)
- `500` - Internal Server Error (ошибка сервера)

## Формат ошибки

```json
{
  "success": false,
  "error": "Error message",
  "code": "ERROR_CODE"
}
```
