# UtilityToolkit - Bundle Management

**UtilityToolkit** is a Swift package that provides utilities for loading and managing resources from your app bundle. This part of the library focuses on managing resources such as JSON files within the bundle, offering convenient methods for loading and decoding data.

## Features

- **Bundle Management**: Easily load and manage files from the app bundle.
- **JSON Decoding**: Decode JSON files from the bundle directly into Swift types.
- **Logging**: Provides structured logging for file loading and decoding operations.

## Key Components

### 1. `DefaultBundleManager`

This struct provides an interface for loading and decoding JSON files from the app's bundle.

#### Functions:
- **`loadJSONData(from: String)`**  
  Loads raw JSON data from a file in the bundle.
  
  ```swift
  public func loadJSONData(from fileName: String) throws -> Data
  ```

- **`decode<T: Decodable>(from: String, as: T.Type)`**  
  Decodes JSON data from a file into a specified Swift type.
  
  ```swift
  public func decode<T: Decodable>(from fileName: String, as type: T.Type) throws -> T
  ```

### 2. `BundleError`

An enum representing possible errors that could occur during bundle file loading or decoding.

#### Cases:
- **`fileNotFound(String)`**: The specified file could not be found in the bundle.
- **`decodingFailure(String)`**: Failed to decode the data from the bundle.

### 3. `LogMessages`

Logs various events such as file loading success or failure, making it easier to debug when files are missing or data can't be loaded.

#### Logging Examples:
- **File Not Found**:
  ```swift
  LogMessages.bundleFileNotFound(fileName: "example.json", functionName: #function)
  ```

- **Data Load Success**:
  ```swift
  LogMessages.bundleLoadDataSuccess(fileName: "example.json", functionName: #function)
  ```

## Example Usage

Here’s a simple example of how to use the `DefaultBundleManager` to load and decode a JSON file from the bundle:

```swift
import UtilityToolkit

struct Photo: Decodable {
    let id: String
    let author: String
}

let bundleManager = DefaultBundleManager()

do {
    let photos: [Photo] = try bundleManager.decode(from: "TestPicsumPhotos", as: [Photo].self)
    print("Loaded \(photos.count) photos from the bundle.")
} catch {
    print("Error loading or decoding file: \(error)")
}
```

## Installation

You can integrate **UtilityToolkit** into your project using Swift Package Manager.

1. In Xcode, go to **File > Swift Packages > Add Package Dependency**.
2. Enter the repository URL: `https://github.com/yourusername/UtilityToolkit`
3. Select the version you want to install and follow the prompts.

Alternatively, you can add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/UtilityToolkit", .upToNextMajor(from: "1.0.0"))
]
```

Then, in your code, import the bundle utilities:

```swift
import UtilityToolkit
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

