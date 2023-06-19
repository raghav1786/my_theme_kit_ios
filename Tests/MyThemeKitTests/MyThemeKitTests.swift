import XCTest
import SwiftUI
@testable import MyThemeKit

final class MyThemeKitTests: XCTestCase {
    func testColors() {
        Theme.current = .market1
        
        
        XCTAssertEqual(Theme.current.red.color, UIColor(named: "market1/red",
                                                        in: .module, compatibleWith: nil)?.suiColor)
        XCTAssertEqual(Theme.current.blue.color, UIColor(named: "market1/blue",
                                                         in: .module, compatibleWith: nil)?.suiColor)
        
        XCTAssertEqual(Theme.current.red.uiColor, UIColor(named: "market1/red",
                                                           in: .module, compatibleWith: nil))
        XCTAssertEqual(Theme.current.blue.uiColor, UIColor(named: "market1/blue",
                                                            in: .module, compatibleWith: nil))
        
        Theme.current = .market2
        
        XCTAssertEqual(Theme.current.red.color, UIColor(named: "market2/red",
                                                        in: .module, compatibleWith: nil)?.suiColor)
        XCTAssertEqual(Theme.current.blue.color, UIColor(named: "market2/blue",
                                                         in: .module, compatibleWith: nil)?.suiColor)
        
        XCTAssertEqual(Theme.current.red.uiColor, UIColor(named: "market2/red",
                                                           in: .module, compatibleWith: nil))
        XCTAssertEqual(Theme.current.blue.uiColor, UIColor(named: "market2/blue",
                                                            in: .module, compatibleWith: nil))
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
