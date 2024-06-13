//
//  DateFormatter.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import Foundation
class DateFormatterManager {
    static let shared = DateFormatterManager()
    
    let dateFormatter: DateFormatter
    let hourlyDateFormatter: DateFormatter
    let hourlyDateFormatterDay: DateFormatter
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E"
        
        hourlyDateFormatter = DateFormatter()
        hourlyDateFormatter.dateFormat = "HH:mm"
        
        hourlyDateFormatterDay = DateFormatter()
        hourlyDateFormatterDay.dateFormat = "MMM d"
    }
}
