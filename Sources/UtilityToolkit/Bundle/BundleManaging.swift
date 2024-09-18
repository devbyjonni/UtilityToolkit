import Foundation

public protocol BundleManaging {
    func loadJSONData(from fileName: String) throws -> Data
    func decode<T: Decodable>(from fileName: String, as type: T.Type) throws -> T
}
