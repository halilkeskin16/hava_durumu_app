---
#[EN]
# Weather App

This is a Flutter-based weather app that provides real-time weather updates based on your current location. It leverages the `geolocator` package to retrieve your geographical position and the `carousel_slider` package to display the weather information in a visually appealing way. The weather data is fetched from the CollectAPI service.

## Features

- **Real-time Location-based Weather:** Uses the `geolocator` package to get the user's current location and fetches weather data for that area.
- **Carousel View for Weather Info:** Displays the weather forecast and other information in a smooth, interactive carousel format using `carousel_slider`.
- **API Integration:** Retrieves weather data from [CollectAPI](https://collectapi.com/) to provide accurate and up-to-date information.

## Packages Used

- [geolocator](https://pub.dev/packages/geolocator) - For accessing the device’s location.
- [carousel_slider](https://pub.dev/packages/carousel_slider) - For creating the carousel view to display the weather data.
- [http](https://pub.dev/packages/http) - For making API requests to CollectAPI.

## Installation

1. Clone the repository from GitHub:
   ```bash
   git clone https://github.com/your-username/weather-app.git
   cd weather-app
   ```

2. Install the necessary dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app on your device or emulator:
   ```bash
   flutter run
   ```

## API Setup

1. Sign up on [CollectAPI](https://collectapi.com/) and obtain an API key for the weather service.
2. Update your `lib/services/weather_services.dart` file with your API key:
   ```dart
   final String url = 'YOUR_API_KEY';
   ```

## How It Works

- The app retrieves the user's location using the `geolocator` package.
- The location coordinates are sent to the CollectAPI to fetch weather data.
- The weather information is displayed in a carousel format, showing details like temperature, humidity, wind speed, and more.

## Screenshots

![image](https://github.com/user-attachments/assets/f983f8c9-1e8e-4c3b-88d9-b12584e39ffb)

## License

This project is licensed under the MIT License.

---
---
#[TR]
# Hava Durumu Uygulaması

Bu, gerçek zamanlı hava durumu bilgilerini konumunuza göre sunan bir Flutter tabanlı hava durumu uygulamasıdır. Kullanıcının coğrafi konumunu almak için `geolocator` paketini ve hava durumu bilgilerini görsel olarak çekici bir şekilde göstermek için `carousel_slider` paketini kullanır. Hava durumu verileri CollectAPI hizmetinden alınmaktadır.

## Özellikler

- **Gerçek Zamanlı Konum Tabanlı Hava Durumu:** Kullanıcının mevcut konumunu almak için `geolocator` paketi kullanılır ve bu bölge için hava durumu bilgileri çekilir.
- **Hava Durumu Bilgileri İçin Carousel Görünümü:** Hava durumu tahminlerini ve diğer bilgileri, `carousel_slider` ile etkileşimli bir carousel formatında gösterir.
- **API Entegrasyonu:** Doğru ve güncel hava durumu bilgilerini sağlamak için [CollectAPI](https://collectapi.com/) kullanılır.

## Kullanılan Paketler

- [geolocator](https://pub.dev/packages/geolocator) - Cihazın konumuna erişmek için.
- [carousel_slider](https://pub.dev/packages/carousel_slider) - Hava durumu bilgilerini göstermek için carousel görünümü oluşturmak için.
- [http](https://pub.dev/packages/http) - CollectAPI'ye API istekleri göndermek için.

## Kurulum

1. GitHub'dan projeyi klonlayın:
   ```bash
   git clone https://github.com/kullanici-adiniz/hava-durumu-uygulamasi.git
   cd hava-durumu-uygulamasi
   ```

2. Gerekli bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```

3. Uygulamayı cihazınızda veya emülatörde çalıştırın:
   ```bash
   flutter run
   ```

## API Ayarları

1. [CollectAPI](https://collectapi.com/) sitesine kaydolun ve hava durumu hizmeti için bir API anahtarı alın.
2. `lib/services/weather_services.dart` dosyasındaki API anahtarınızı güncelleyin:
   ```dart
   final String url = 'API_ANAHTARINIZ';
   ```

## Nasıl Çalışır?

- Uygulama, `geolocator` paketini kullanarak kullanıcının konumunu alır.
- Konum koordinatları, hava durumu verilerini almak için CollectAPI'ye gönderilir.
- Hava durumu bilgileri, sıcaklık, nem, rüzgar hızı gibi detayları carousel formatında gösterir.

## Ekran Görüntüleri

![image](https://github.com/user-attachments/assets/f983f8c9-1e8e-4c3b-88d9-b12584e39ffb)

## Lisans

Bu proje MIT Lisansı altında lisanslanmıştır.

---
