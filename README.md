# URLProtocolExtensions

Work with `URLRequest` instead of `NSMutableURLRequest` when using `URLProtocol` `setProperty` and `removeProperty` class methods.

It seems like this API has some technical debt and haven't been updated since 2016 according to the Swift Core team's [repository](https://github.com/apple/swift-corelibs-foundation/issues/4324).
While this implementation isn't perfect, as is noted in the Swift Core teams issue, it does make it infinitly easier to work with the API.

## Usage

Following example implements an additional property `bearerToken` on `URLRequest` using `URLProtocol` property class methods.

```swift
extension URLRequest {
    public var bearerToken: String? {
        get {
            return URLProtocol.property(forKey: "BearerToken", in: self) as? String
        }
        set(newValue) {
            if let newBearerToken = newValue {
                URLProtocol.setProperty(newBearerToken, forKey: "BearerToken", in: &self)
            } else {
                URLProtocol.removeProperty(forKey: "BearerToken", in: &self)
            }
        }
    }
}

```
