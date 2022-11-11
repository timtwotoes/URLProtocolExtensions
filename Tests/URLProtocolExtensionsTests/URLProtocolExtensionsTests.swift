import XCTest
@testable import URLProtocolExtensions

final class URLProtocolExtensionsTests: XCTestCase {
    private var primaryRequest: URLRequest!
    private var secondaryRequest: URLRequest!
    
    override func setUpWithError() throws {
        primaryRequest = URLRequest(url: URL(string: "https://example.com")!)
        secondaryRequest = URLRequest(url: URL(string: "https://example.com")!)
    }
    
    override func tearDownWithError() throws {
        primaryRequest = nil
        secondaryRequest = nil
    }
    
    func testSetProperty() throws {
        URLProtocol.setProperty("foo", forKey: "TestKey", in: &primaryRequest)
        URLProtocol.setProperty(true, forKey: "TestKey", in: &secondaryRequest)
        
        guard let primaryValue = URLProtocol.property(forKey: "TestKey", in: primaryRequest) else {
            XCTFail("primaryRequest did not contain \"TestKey\"")
            return
        }
        
        guard let primaryResult = primaryValue as? String else {
            XCTFail("Expected type of String but found \(String(describing: type(of: primaryValue)))")
            return
        }
        
        XCTAssertEqual("foo", primaryResult)
        
        guard let secondaryValue = URLProtocol.property(forKey: "TestKey", in: secondaryRequest) else {
            XCTFail("primaryRequest did not contain \"TestKey\"")
            return
        }
        
        guard let secondaryResult = secondaryValue as? Bool else {
            XCTFail("Expected type of Bool but found \(String(describing: type(of: secondaryValue)))")
            return
        }
        
        XCTAssertTrue(secondaryResult)
    }
    
    func testRemoveProperty() throws {
        URLProtocol.setProperty(true, forKey: "TestKey", in: &primaryRequest)
        XCTAssertNotNil(URLProtocol.property(forKey: "TestKey", in: primaryRequest))
        
        URLProtocol.removeProperty(forKey: "TestKey", in: &primaryRequest)
        XCTAssertNil(URLProtocol.property(forKey: "TestKey", in: primaryRequest))
    }
}
