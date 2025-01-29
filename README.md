# PaginatorX

PaginatorX is a Dart library designed to simplify the handling of paginated responses from various data sources. It provides a flexible and efficient way to manage pagination in your Flutter applications.

---

## Features

- **Flexible Data Source Integration:** Easily integrate with APIs, databases, or any data source that supports pagination.
- **Customizable Page Size:** Define the number of items per page to suit your application's needs.
- **Asynchronous Data Fetching:** Supports asynchronous operations for fetching data, making it suitable for real-time applications.
- **Error Handling:** Built-in mechanisms to handle errors during data retrieval.
- **Lightweight:** Minimal dependencies ensure easy integration and maintenance.

---

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  paginatorx: ^1.0.0
```
Then, run flutter pub get to install the package.

## File Structure

```
    paginatorx/
    ├── lib/
    │   ├── paginatorx.dart
    │   └── src/
    │       ├── paginator.dart
    │       ├── page_result.dart
    │       └── pagination_config.dart
    ├── example/
    │   ├── lib/
    │   │   └── main.dart
    │   └── pubspec.yaml
    ├── test/
    │   ├── paginator_test.dart
    │   └── data_source_test.dart
    ├── .gitignore
    ├── CHANGELOG.md
    ├── LICENSE
    └── README.md
    
    ```

### Key Components

1. **`lib/paginatorx.dart`**  
   Exports the main functionalities of the library.

2. **`lib/src/paginator.dart`**  
   Contains the `Paginator` class that manages pagination logic.

3. **`lib/src/page_result.dart`**  
   Defines the `PageResult` class, representing the result of a single page fetch.

4. **`lib/src/pagination_config.dart`**  
   Contains the `PaginationConfig` class for configuring pagination parameters.

5. **`example/lib/main.dart`**  
   Example Flutter application demonstrating the use of PaginatorX.

6. **`test/paginator_test.dart`**  
   Unit tests for the `Paginator` class.

7. **`test/data_source_test.dart`**  
   Unit tests for data source integrations.


## Usage

### Basic Example

Here's a simple example to get started with PaginatorX:

```dart
import 'package:paginatorx/paginatorx.dart';

void main() {
  final paginator = Paginator<int>(
    config: PaginationConfig(pageSize: 10),
    dataSource: (page, pageSize) async {
      // Replace with your data fetching logic
      final data = List.generate(100, (index) => index + 1);
      final start = (page - 1) * pageSize;
      final end = start + pageSize;
      final items = data.sublist(start, end > data.length ? data.length : end);
      return PageResult(items: items, nextPage: end < data.length ? page + 1 : null);
    },
  );

  paginator.loadNextPage().then((result) {
    print('Loaded items: ${result.items}');
    if (result.nextPage == null) {
      print('No more pages.');
    }
  }).catchError((error) {
    print('Error loading page: $error');
  });
}
```


### Custom Data Source

To integrate PaginatorX with your specific data source, you can define a custom data fetching function. Here's how you can implement it:

```dart
import 'package:paginatorx/paginatorx.dart';

Future<PageResult<MyData>> fetchPage(int page, int pageSize) async {
  // Implement your data fetching logic here
  final response = await api.getData(page, pageSize); // Replace with actual API call
  return PageResult(
    items: response.items, // List of items for the current page
    nextPage: response.hasMore ? page + 1 : null, // Determine if more pages are available
  );
}

final paginator = Paginator<MyData>(
  pageSize: 20, // Customize the page size as needed
  dataSource: fetchPage, // Provide the custom data source function
);

paginator.loadNextPage().then((result) {
  print('Loaded items: ${result.items}');
  if (result.nextPage == null) {
    print('No more pages.');
  }
}).catchError((error) {
  print('Error loading page: $error');
});
```

### Explanation

1. **`fetchPage` Function**  
   This asynchronous function encapsulates the logic for fetching a specific page of data. Replace `api.getData` with your actual data fetching implementation.

2. **`PageResult` Object**  
   The `PageResult` object contains:
   - `items`: A list of data items retrieved for the current page.
   - `nextPage`: The next page number, or `null` if no more pages are available.

3. **Paginator Configuration**  
   - `pageSize`: Defines the number of items per page to suit your needs.
   - `dataSource`: Specifies the function to fetch data from the custom source.


## Error Handling

PaginatorX includes built-in mechanisms to handle errors during data retrieval. To gracefully manage errors, you can use the following pattern:

```dart
paginator.loadNextPage().then((result) {
  print('Loaded items: ${result.items}');
}).catchError((error) {
  print('Failed to load data: $error');
});
```
