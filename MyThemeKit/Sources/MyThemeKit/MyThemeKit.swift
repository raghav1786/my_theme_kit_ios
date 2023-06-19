public enum Theme {
    case market1
    case market2
    
    public static var current = Theme.market1 {
        didSet {
            let fontName = FontFamily.fontName(theme: current)
            FontFamily.registerFonts(fontName: fontName)
        }
    }
}
