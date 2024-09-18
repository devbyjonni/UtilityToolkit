import Foundation

public enum BundleError: Error, Equatable {
    case fileNotFound(String)
    case failedToLoadData(String)
    case decodingError(String)
    
    public var localizedDescription: String {
        switch self {
        case .fileNotFound(let fileName):
            return "File not found: \(fileName)"
        case .failedToLoadData(let fileName):
            return "Failed to load data from file: \(fileName)"
        case .decodingError(let message):
            return "Decoding Error: \(message)"
        }
    }
    
    public static func == (lhs: BundleError, rhs: BundleError) -> Bool {
        switch (lhs, rhs) {
        case (.fileNotFound(let lhsFile), .fileNotFound(let rhsFile)):
            return lhsFile == rhsFile
        case (.failedToLoadData(let lhsFile), .failedToLoadData(let rhsFile)):
            return lhsFile == rhsFile
        default:
            return false
        }
    }
}
