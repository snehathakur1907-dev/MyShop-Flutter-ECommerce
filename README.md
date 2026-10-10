# 🛍️ MyShop – Flutter Mini E-Commerce Application

**MyShop** is a simple and modern mobile shopping application developed using Flutter and Dart. It allows users to explore products by category, view promotional banners, search for products, and navigate to individual product detail pages.

The application uses static product data and focuses on building a responsive user interface with reusable widgets and smooth navigation.

## 📱 Project Overview

- **Project Name:** MyShop
- **Application Type:** Mini E-Commerce Mobile Application
- **Framework:** Flutter
- **Programming Language:** Dart
- **UI Design:** Material Design 3
- **Product Data:** Static/local data
- **Platform:** Android

## ✨ Features

- **Home Page:** Displays the application logo, welcome message, promotional banners, categories, and popular products.
- **Product Categories:** Browse products across five categories: Electronics, Fashion, Shoes, Beauty, and Accessories.
- **Promotional Carousel:** Displays three promotional banners using the `carousel_slider` package.
- **Product Cards:** Reusable product cards featuring images, names, prices, ratings, and NEW labels.
- **Product Search:** Search products by name or category.
- **Product Details:** View product images, descriptions, ratings, categories, and prices.
- **Navigation:** Navigate between the home page, category pages, and product detail pages.
- **Interactive Buttons:** Includes product details buttons, favorite icons, and an Add to Cart demonstration.
- **Modern UI:** Uses rounded cards, icons, a consistent colour palette, and scrollable layouts.

## 🗂️ Project Structure

```text
myshop/
├── assets/
│   └── images/
├── lib/
│   ├── data/
│   │   └── product_data.dart
│   ├── models/
│   │   └── product.dart
│   ├── screens/
│   │   ├── home_page.dart
│   │   ├── category_page.dart
│   │   └── product_details_page.dart
│   ├── widgets/
│   │   ├── banner_carousel.dart
│   │   ├── category_item.dart
│   │   └── product_card.dart
│   └── main.dart
├── test/
├── android/
├── ios/
├── web/
├── windows/
├── pubspec.yaml
└── README.md
```

## 🛠️ Technologies and Packages

| Technology | Purpose |
|---|---|
| Flutter | Mobile application development |
| Dart | Application programming |
| Material Design 3 | UI components and styling |
| `carousel_slider` | Promotional image carousel |
| `Navigator` | Screen navigation |
| `GridView.builder` | Product grid layout |
| `ListView` | Scrollable category list |
| `Stack` and `Positioned` | Product labels and overlay icons |
| `Image.network` | Display product images |

## 🚀 Getting Started

### Prerequisites

Before running the application, install:

- Flutter SDK
- Dart SDK (included with Flutter)
- Android Studio or Visual Studio Code
- Android emulator or a physical Android device
- Git (optional, for version control)

### Installation

**1. Clone the repository**

Replace `YOUR-USERNAME` with your GitHub username.

```bash
git clone https://github.com/YOUR-USERNAME/MyShop-Flutter-ECommerce.git
```

**2. Navigate to the project directory**

```bash
cd MyShop-Flutter-ECommerce
```

**3. Install dependencies**

```bash
flutter pub get
```

**4. Check the Flutter environment**

```bash
flutter doctor
```

**5. Run the application**

Start an Android emulator or connect a device, then execute:

```bash
flutter run
```

## 🛒 Application Screens

### 1. Home Page

The home page displays promotional banners, product categories, and popular products.

### 2. Category Page

Users can select a category to browse its available products in a grid layout.

### 3. Product Details Page

Users can view the selected product's image, name, price, rating, and description.

### Screenshots

Add your actual application screenshots to the repository's `screenshots/` folder and update the image paths below.

**Home Page**

![MyShop Home Page](screenshots/home_page.png)

**Category Page**

![MyShop Category Page](screenshots/category_page.png)

**Product Details Page**

![MyShop Product Details](screenshots/product_details_page.png)

## 📌 Project Scope

This application was developed as a Flutter mini e-commerce assignment to demonstrate UI development, reusable widgets, scrolling layouts, external package integration, product categorisation, and screen navigation.

The application uses static product information. Backend integration, user authentication, online payments, persistent cart management, and database functionality are outside the current project scope.

The Add to Cart button provides a demonstration message only; it does not save products to a real shopping cart.

## 🔮 Future Enhancements

- Add a functional shopping cart.
- Implement user authentication.
- Integrate a product database or API.
- Add order placement and payment functionality.
- Save favourite products.
- Add filters and sorting options.
- Store product images locally for offline use.

## 👩‍💻 Author

**Name:** Sneha Thakur  
**Student ID:** [2510412269]  
**Course:** Mobile Application Development  
**Project:** Flutter Mini E-Commerce Application

## 📄 License

This project was developed for educational purposes as part of a Flutter application development assignment.
