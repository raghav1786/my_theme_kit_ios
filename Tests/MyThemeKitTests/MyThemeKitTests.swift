import XCTest
import SwiftUI
@testable import MyThemeKit

final class MyThemeKitTests: XCTestCase {
    func testColors() {
        Theme.current = .market1
        
        
        XCTAssertNotNil(Theme.current.red.color)
        XCTAssertNotNil(Theme.current.blue.color)
        
        XCTAssertNotNil(Theme.current.red.uiColor)
        XCTAssertNotNil(Theme.current.blue.uiColor)
    }
    
    func testFonts() {
        Theme.current = .market1
        XCTAssertEqual(Theme.current.headline1.uiFont,
                       UIFont(name: "GTWalsheimPro-Bold",
                              size: 49.00))
        XCTAssertEqual(Theme.current.headline1.font,
                       UIFont(name: "GTWalsheimPro-Bold",
                              size: 49.00)?.suiFont)
        XCTAssertEqual(Theme.current.headline1.lineHeight,56.0)
    }
}
