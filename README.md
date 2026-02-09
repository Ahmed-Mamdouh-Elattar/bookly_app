# 📚 Bookly - Free Books Discovery App

A beautiful and modern Flutter application for discovering and exploring free ebooks using the Google Books API. Built with clean architecture principles and state management using BLoC pattern.

## ✨ Features

### 🏠 Home Screen
- **Featured Books Carousel**: Horizontally scrollable list of featured free ebooks
- **Newest Books List**: Vertically scrollable list of the latest free ebooks
- **Beautiful UI**: Dark theme with custom fonts and smooth animations
- **Book Covers**: Cached network images for optimal performance

### 🔍 Search Functionality
- **Real-time Search**: Search for books across all categories
- **Debounced Input**: Optimized search with 500ms debounce to reduce API calls
- **Search Results**: Display matching books with cover images, titles, authors, and ratings
- **Empty State Handling**: User-friendly messages for no results or empty searches

### 📖 Book Details
- **Comprehensive Information**: View book title, author, rating, and description
- **Similar Books**: Discover related books based on category
- **Preview Button**: Open book preview in web browser
- **Free Badge**: All books are free to access

### 🎨 UI/UX Features
- **Dark Theme**: Eye-friendly dark color scheme
- **Custom Fonts**: GT Sectra Fine for elegant typography
- **Smooth Transitions**: Fade animations between screens
- **Responsive Design**: Adapts to different screen sizes
- **Error Handling**: User-friendly error messages with retry options
- **Loading States**: Circular progress indicators during data fetching

## 📱 Screenshots

<div align="center">
  <img src="assets/screenshots/home.jpeg" width="250" alt="Home Screen"/>
  <img src="assets/screenshots/search_page.jpeg" width="250" alt="Search Screen"/>
  <img src="assets/screenshots/book_details_page.jpeg" width="250" alt="Book Details"/>
</div>

## 🏗️ Architecture

This project follows **Clean Architecture** principles with a feature-first folder structure:

```
lib/
├── core/                          # Shared resources
│   ├── errors/                    # Error handling (Failures)
│   ├── helper/                    # Constants and helpers
│   ├── models/                    # Shared domain models
│   │   └── book_model/           # BookModel and related entities
│   ├── utils/                     # Utilities
│   │   ├── api_services.dart     # HTTP client wrapper
│   │   ├── app_router.dart       # Navigation configuration
│   │   ├── app_style.dart        # Text styles
│   │   └── service_locator.dart  # Dependency injection
│   └── widgets/                   # Reusable UI components
│       ├── book_list_view_item.dart
│       ├── book_rating.dart
│       ├── custom_book_image.dart
│       ├── book_price.dart
│       ├── custom_button.dart
│       ├── custom_error.dart
│       └── custom_progress_indicator.dart
│
├── features/                      # Feature modules
│   ├── home/                     # Home feature
│   │   ├── data/
│   │   │   └── repos/           # Repository implementations
│   │   │       ├── home_repo.dart
│   │   │       └── home_repo_impl.dart
│   │   └── presentation/
│   │       ├── manager/         # State management (Cubits)
│   │       │   ├── featured_books_cubit/
│   │       │   ├── newest_books_cubit/
│   │       │   └── similar_books_cubit/
│   │       └── views/           # UI screens and widgets
│   │
│   ├── search/                   # Search feature
│   │   ├── data/
│   │   │   └── repos/           # Repository implementations
│   │   │       ├── search_repo.dart
│   │   │       └── search_repo_impl.dart
│   │   └── presentation/
│   │       ├── manager/         # State management (Cubits)
│   │       │   └── search_cubit/
│   │       └── views/           # UI screens and widgets
│   │
│   └── splash/                   # Splash screen feature
│       └── presentation/
│           └── views/
│
└── main.dart                     # App entry point
```

### Architecture Layers

1. **Presentation Layer**
   - UI components (Views & Widgets)
   - State management (BLoC/Cubit)
   - User interaction handling

2. **Data Layer**
   - Repository implementations
   - API service integration
   - Data models and parsing

### Key Architectural Decisions

- ✅ **Feature-First Structure**: Each feature is self-contained and independent
- ✅ **Shared Core Layer**: Common models and widgets in `core/` to avoid duplication
- ✅ **Dependency Injection**: Using `get_it` for service locator pattern
- ✅ **Repository Pattern**: Abstract repositories for data access
- ✅ **BLoC Pattern**: State management with `flutter_bloc`
- ✅ **Either Type**: Using `dartz` for functional error handling

## 🛠️ Tech Stack

### Core Dependencies
- **Flutter SDK**: ^3.4.4
- **Dart**: ^3.4.4

### State Management & Architecture
- **flutter_bloc**: ^8.1.6 - State management
- **equatable**: ^2.0.5 - Value equality
- **dartz**: ^0.10.1 - Functional programming (Either type)
- **get_it**: ^8.0.0 - Dependency injection

### Networking & Data
- **dio**: ^5.7.0 - HTTP client
- **cached_network_image**: ^3.4.1 - Image caching

### UI & Navigation
- **go_router**: ^14.2.3 - Declarative routing
- **google_fonts**: ^6.2.1 - Custom fonts
- **font_awesome_flutter**: ^10.7.0 - Icons
- **url_launcher**: ^6.3.0 - Open URLs
- **webview_flutter**: ^4.9.0 - In-app browser

### Development Tools
- **device_preview**: ^1.2.0 - Preview on multiple devices
- **flutter_lints**: ^3.0.0 - Linting rules

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.4.4 or higher)
- Dart SDK (3.4.4 or higher)
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Ahmed-Mamdouh-Elattar/bookly_app.git
   cd bookly_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Build for Production

**Android**
```bash
flutter build apk --release
```

**iOS**
```bash
flutter build ios --release
```

**Web**
```bash
flutter build web --release
```

## 🔑 API Integration

This app uses the **Google Books API** to fetch book data. No API key is required for basic usage.

**Base URL**: `https://www.googleapis.com/books/v1/`

### Endpoints Used
- `volumes?q={query}&filter=free-ebooks` - Search books
- `volumes?q=book&orderBy=newest&filter=free-ebooks` - Newest books
- `volumes?q={category}&filter=free-ebooks` - Similar books by category

## 📦 Project Structure Details

### State Management Pattern

Each feature uses the **BLoC (Cubit)** pattern:

```dart
// Example: SearchCubit
class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;
  Timer? _debounce;

  void fetchSearchedBooks({required String searchedText}) async {
    // Debounce logic
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      emit(SearchLoading());
      var result = await searchRepo.fetchSearchedBooks(searchedText: searchedText);
      result.fold(
        (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
        (books) => emit(SearchSuccess(books: books)),
      );
    });
  }
}
```

### Repository Pattern

```dart
// Abstract Repository
abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String searchedText,
  });
}

// Implementation
class SearchRepoImpl implements SearchRepo {
  final ApiServices apiServices;
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String searchedText,
  }) async {
    // API call implementation
  }
}
```

## 🎯 Key Features Implementation

### 1. Debounced Search
Prevents excessive API calls by waiting 500ms after user stops typing:
```dart
Timer? _debounce;
_debounce = Timer(const Duration(milliseconds: 500), () async {
  // Perform search
});
```

### 2. Error Handling
Using `Either` type from `dartz` for functional error handling:
```dart
Future<Either<Failure, List<BookModel>>> fetchBooks() async {
  try {
    var data = await apiServices.get(endpoint: "...");
    return right(books);
  } catch (e) {
    return left(ServerFailure.fromDioError(e));
  }
}
```

### 3. Dependency Injection
Using `get_it` for service locator:
```dart
void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(Dio(), baseUrl: "https://www.googleapis.com/books/v1/"),
  );
  getIt.registerSingleton<SearchRepoImpl>(
    SearchRepoImpl(getIt.get<ApiServices>()),
  );
}
```

## 🎨 Design System

### Colors
- **Primary**: `#100B20` - Dark background
- **Accent**: `#EF8262` - Orange for CTAs

### Typography
- **Primary Font**: Montserrat (Google Fonts)
- **Display Font**: GT Sectra Fine (Custom)

### Text Styles
- `textStyle30`: 30px, GT Sectra Fine
- `textStyle20`: 20px, GT Sectra Fine
- `textStyle18`: 18px, Montserrat SemiBold
- `textStyle16`: 16px, Montserrat Medium
- `textStyle14`: 14px, Montserrat Regular

## 🧪 Testing

Run tests:
```bash
flutter test
```

## 📝 Code Quality

This project follows:
- ✅ Flutter linting rules
- ✅ Clean Architecture principles
- ✅ SOLID principles
- ✅ Separation of concerns
- ✅ DRY (Don't Repeat Yourself)


## 🙏 Acknowledgments

- [Google Books API](https://developers.google.com/books) for providing free book data
- [Flutter](https://flutter.dev) team for the amazing framework
- [BLoC Library](https://bloclibrary.dev) for state management solution


