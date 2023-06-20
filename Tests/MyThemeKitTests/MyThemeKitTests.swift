import XCTest
import SwiftUI
@testable import MyThemeKit

final class MyThemeKitTests: XCTestCase {
    func testColors() {
        Theme.current = .market1
        
        
        XCTAssertEqual(Theme.current.headline1.color, UIColor(named: "market1/headline1",
                                                        in: .module, compatibleWith: nil)?.suiColor)
        XCTAssertEqual(Theme.current.body.color, UIColor(named: "market1/body",
                                                         in: .module, compatibleWith: nil)?.suiColor)
        
        XCTAssertEqual(Theme.current.headline1.uiColor, UIColor(named: "market1/headline1",
                                                           in: .module, compatibleWith: nil))
        XCTAssertEqual(Theme.current.body.uiColor, UIColor(named: "market1/body",
                                                            in: .module, compatibleWith: nil))
        
        Theme.current = .market2
        
        XCTAssertEqual(Theme.current.headline1.color, UIColor(named: "market2/headline1",
                                                        in: .module, compatibleWith: nil)?.suiColor)
        XCTAssertEqual(Theme.current.body.color, UIColor(named: "market2/body",
                                                         in: .module, compatibleWith: nil)?.suiColor)
        
        XCTAssertEqual(Theme.current.headline1.uiColor, UIColor(named: "market2/headline1",
                                                           in: .module, compatibleWith: nil))
        XCTAssertEqual(Theme.current.body.uiColor, UIColor(named: "market2/body",
                                                            in: .module, compatibleWith: nil))
    }
    
    func testFonts() {
        Theme.current = .market1
        XCTAssertEqual(Theme.current.headline1Font.uiFont,
                       UIFont(name: "GTWalsheimPro-Bold",
                              size: 49.00))
        XCTAssertEqual(Theme.current.headline1Font.font,
                       UIFont(name: "GTWalsheimPro-Bold",
                              size: 49.00)?.suiFont)
        XCTAssertEqual(Theme.current.bodyFont.uiFont,
                       UIFont(name: "GTWalsheimPro-Medium",
                              size: 18.00))
        XCTAssertEqual(Theme.current.bodyFont.font,
                       UIFont(name: "GTWalsheimPro-Medium",
                              size: 18.00)?.suiFont)
        XCTAssertEqual(Theme.current.bodyFont.lineHeight,24.0)
    }
}
