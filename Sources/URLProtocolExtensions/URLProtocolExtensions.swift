import Foundation

extension URLProtocol {
    
    /// Sets the property associated with the specified key in the specified request.
    ///
    /// Use this method to provide an interface for protocol implementors to customize
    /// protocol-specific information associated with ``URLRequest`` objects.
    ///
    /// - Parameters:
    ///   - value: The alue to set for the specified property.
    ///   - key: The key for the specified property.
    ///   - request: A reference to the request for which to create the property.
    public class func setProperty(_ value: Any, forKey key: String, in request: inout URLRequest) {
        let mutableRequest = (request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        URLProtocol.setProperty(value, forKey: key, in: mutableRequest)
        request = mutableRequest as URLRequest
    }
    
    
    /// Removes the property associated with the specified request.
    ///
    /// This method is used to provied an interface for protocol implementors to customize
    /// protocol-specific information associated with ``URLRequest`` objects.
    ///
    /// - Parameters:
    ///   - key: The key whose value should be removed.
    ///   - request: A reference to the request from which to remove the property value.
    public class func removeProperty(forKey key: String, in request: inout URLRequest) {
        let mutableRequest = (request as NSURLRequest).mutableCopy() as! NSMutableURLRequest
        URLProtocol.removeProperty(forKey: key, in: mutableRequest)
        request = mutableRequest as URLRequest
    }
}
