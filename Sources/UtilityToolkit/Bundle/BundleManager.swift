import Foundation
import os.log

public struct DefaultBundleManager: BundleManaging {
    
    public init() {}
    
    public func loadJSONData(from fileName: String) throws -> Data {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            LogMessages.bundleFileNotFound(fileName: fileName, functionName: #function)
            throw BundleError.fileNotFound(fileName)
        }
        
        do {
            let data = try Data(contentsOf: url)
            LogMessages.bundleLoadDataSuccess(fileName: fileName, functionName: #function)
            return data
        } catch {
            LogMessages.bundleDecodeFailure(fileName: fileName, error: error.localizedDescription, functionName: #function)
            throw BundleError.failedToLoadData(fileName)
        }
    }
    
    public func decode<T: Decodable>(from fileName: String, as type: T.Type) throws -> T {
        let data = try loadJSONData(from: fileName)
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            LogMessages.bundleDecodeSuccess(fileName: fileName, functionName: #function)
            return decodedData
        } catch {
            LogMessages.bundleDecodeFailure(fileName: fileName, error: error.localizedDescription, functionName: #function)
            throw BundleError.decodingError("Failed to decode JSON from file: \(fileName)")
        }
    }
}

//MARK: BundleManager logging
extension LogMessages {
    static let bundleLogger = Logger(subsystem: "com.photofetcher.bundle", category: "BundleManager")
    
    static func bundleFileNotFound(fileName: String, functionName: String = #function) {
        bundleLogger.error("[\(functionName)] - File not found: \(fileName)")
    }
    
    static func bundleLoadDataSuccess(fileName: String, functionName: String = #function) {
        bundleLogger.debug("[\(functionName)] - Successfully loaded data from file: \(fileName)")
    }
    
    static func bundleLoadDataFailure(fileName: String, error: String, functionName: String = #function) {
        bundleLogger.error("[\(functionName)] - Failed to load data from file: \(fileName), error: \(error)")
    }
    
    static func bundleDecodeSuccess(fileName: String, functionName: String = #function) {
        bundleLogger.debug("[\(functionName)] - Successfully decoded JSON from file: \(fileName)")
    }
    
    static func bundleDecodeFailure(fileName: String, error: String, functionName: String = #function) {
        bundleLogger.error("[\(functionName)] - Failed to decode JSON from file: \(fileName), error: \(error)")
    }
}


