import SwiftUI

final class ViewModel: ObservableObject {
    @Published var hex: String
    
    init() {
        self.hex = ""
    }
    
    func updateTime() -> String {
        let date = Date()
        return formatterNumber(date: date)
    }
    
    private func formatterNumber(date: Date, calendar: Calendar = Calendar.current) -> String {
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        let padNumber = { n in String(format: "%02d", n) }
        
        return "#\(padNumber(hour))\(padNumber(minute))\(padNumber(second))"
    }
}
