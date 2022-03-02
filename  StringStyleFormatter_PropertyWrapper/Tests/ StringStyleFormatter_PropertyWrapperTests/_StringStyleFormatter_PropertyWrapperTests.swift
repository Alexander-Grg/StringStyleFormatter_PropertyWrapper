import XCTest
@testable import _StringStyleFormatter_PropertyWrapper

final class _StringStyleFormatter_PropertyWrapperTests: XCTestCase {
    func testCamelCase() throws {
        @CodingStyle(style: StringStyle.camelCase) var myProperty = "Hello world"
        XCTAssertEqual(myProperty, "HelloWorld")
    }
    
    func testSnakeCase() throws {
        @CodingStyle(style: StringStyle.snakeCase) var myProperty = "Hello World"
        XCTAssertEqual(myProperty, "Hello_World")
    }
    
    func testKebabCase() throws {
        @CodingStyle(style: StringStyle.kebabCase) var myProperty = "Hello World"
        XCTAssertEqual(myProperty, "Hello-World")
    }
}
