# Инструкция по переключению с моков на реальный API

## Шаг 1: Обновите baseUrl в ApiService

Откройте файл `lib/services/api_service.dart` и измените базовый URL:

```dart
ApiService({this.baseUrl = 'https://your-api-domain.com/api'});
```

Замените `https://your-api-domain.com/api` на реальный URL вашего API.

## Шаг 2: Замените MockApiService на ApiService

Откройте файл `lib/main.dart` и найдите все места, где используется `MockApiService`, замените на `ApiService`.

### В провайдерах:

**lib/providers/auth_provider.dart:**
```dart
// Было:
final MockApiService _apiService = MockApiService();

// Стало:
final ApiService _apiService = ApiService(baseUrl: 'https://your-api-domain.com/api');
```

**lib/providers/products_provider.dart:**
```dart
// Было:
final MockApiService _apiService = MockApiService();

// Стало:
final ApiService _apiService = ApiService(baseUrl: 'https://your-api-domain.com/api');
```

**lib/providers/favorites_provider.dart:**
```dart
// Было:
final MockApiService _apiService = MockApiService();

// Стало:
final ApiService _apiService = ApiService(baseUrl: 'https://your-api-domain.com/api');
```

**lib/providers/orders_provider.dart:**
```dart
// Было:
final MockApiService _apiService = MockApiService();

// Стало:
final ApiService _apiService = ApiService(baseUrl: 'https://your-api-domain.com/api');
```

**lib/pages/contact_page.dart:**
```dart
// Было:
final _apiService = MockApiService();

// Стало:
final _apiService = ApiService(baseUrl: 'https://your-api-domain.com/api');
```

## Шаг 3: Обновите импорты

Во всех файлах, где используется `MockApiService`, замените импорт:

```dart
// Было:
import '../services/mock_api_service.dart';

// Стало:
import '../services/api_service.dart';
```

## Шаг 4: Добавьте сохранение токена

В `lib/providers/auth_provider.dart` добавьте сохранение токена в `ApiService`:

```dart
Future<bool> verifySms(String phone, String code) async {
  // ... существующий код ...
  if (response['success'] == true) {
    _token = response['token'] as String;
    _user = User.fromJson(response['user'] as Map<String, dynamic>);
    
    // Добавьте эту строку:
    _apiService.setToken(_token!);
    
    // ... остальной код ...
  }
}
```

## Шаг 5: Установите зависимости

Убедитесь, что пакет `http` установлен. Выполните:

```bash
flutter pub get
```

## Шаг 6: Проверьте API документацию

Убедитесь, что ваш бэкенд соответствует API документации в файле `API_DOCUMENTATION.md`.

## Шаг 7: Тестирование

После переключения протестируйте все функции:
- ✅ Регистрация и вход
- ✅ Просмотр товаров
- ✅ Поиск и фильтрация по категориям
- ✅ Добавление в избранное
- ✅ Добавление в корзину
- ✅ Оформление заказа
- ✅ История заказов
- ✅ Связь с нами

## Важные замечания

1. **Обработка ошибок**: Реальный API может возвращать ошибки. Убедитесь, что все методы обрабатывают ошибки корректно.

2. **Токен авторизации**: Токен должен сохраняться и передаваться во всех запросах, требующих авторизации.

3. **Формат дат**: Убедитесь, что формат дат соответствует ISO 8601.

4. **Изображения**: URL изображений должны быть полными (с http/https).

5. **Телефон**: Формат телефона должен быть единообразным (например, +79991234567).

## Альтернативный подход: Использование конфигурации

Вы можете создать файл конфигурации для переключения между моками и реальным API:

**lib/config/app_config.dart:**
```dart
class AppConfig {
  static const bool useMockApi = false; // Измените на false для реального API
  static const String apiBaseUrl = 'https://your-api-domain.com/api';
}
```

Затем в провайдерах:
```dart
final apiService = AppConfig.useMockApi 
    ? MockApiService() 
    : ApiService(baseUrl: AppConfig.apiBaseUrl);
```
