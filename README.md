# PinApp

## Technical Challenge

**PinApp** is a Flutter application that demonstrates fetching and displaying posts from a remote API, along with their comments. Users can search for posts, view details, and like/unlike posts, with likes reflected in the main list.

---

## Features

- Display a scrollable, paginated list of posts.
- Search posts by title using a search bar at the top.
- Tap a post to view its details and comments.
- Like/unlike posts, with the like status synchronized with the main list.
- Infinite scroll for efficient post loading.

---

## API Endpoints

- **Posts:**  
`https://jsonplaceholder.typicode.com/posts`

- **Comments by Post ID:**  
`https://jsonplaceholder.typicode.com/comments?postId={postId}`  
> Replace `{postId}` with the corresponding post ID to fetch its comments.

---

## Implementation Details

- Built with **Flutter** targeting **Android** and **iOS** platforms.
- Posts are fetched directly in Flutter using HTTP requests.
- Comments are fetched using native code on each platform:  
  - **Swift** for iOS  
  - **Kotlin** for Android
- State management is implemented with **Flutter Bloc**.
- Infinite scroll with pagination is implemented for posts.
- Search functionality uses a **SearchDelegate**.

---

## Dependencies

- `flutter_bloc` – Bloc state management.  
- `http` – HTTP client for network requests.  
- `equatable` – For value equality in Bloc states.  
- `mocktail` – For unit/ widget tests.  
- `bloc_test` – For bloc tests.  

> Run `flutter pub get` to install dependencies.

---

## Getting Started

1. **Clone the repository**  
git clone <your-repo-url>
2. **Install dependencies**  
flutter pub get
2. **Run the application**  
flutter run``` 