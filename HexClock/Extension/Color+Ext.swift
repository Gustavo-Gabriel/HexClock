import SwiftUI

extension Color {
    static func hexStringToColor(_ hex: String, opacity: Double = 1.0) -> Color {
        var string: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if string.hasPrefix("#") {
            string.remove(at: string.startIndex)
        }
        
        if string.count != 6 {
            return Color.gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: string).scanHexInt64(&rgbValue)
        
        let color = Color(
            red: Double((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: Double((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgbValue & 0x0000FF) / 255.0,
            opacity: opacity)
        
        return color
    }
}
