//
//  DateFormatter.swift
//  SwiftUICollab
//
//  Created by Luka  Kharatishvili on 13.06.24.
//

import Foundation

class DateFormatterManager: ObservableObject {
    static let shared = DateFormatterManager(timezoneIdentifier: "Europe/Berlin")

    var timezoneIdentifier: String {
        didSet {
            updateFormattersTimezone()
        }
    }

    var dateFormatter: DateFormatter
    var hourlyDateFormatter: DateFormatter
    var hourlyDateFormatterDay: DateFormatter

    init(timezoneIdentifier: String) {
        self.timezoneIdentifier = timezoneIdentifier
        dateFormatter = DateFormatter()
        hourlyDateFormatter = DateFormatter()
        hourlyDateFormatterDay = DateFormatter()
        updateFormattersTimezone()
    }

    private func updateFormattersTimezone() {
        dateFormatter.dateFormat = "E"
        dateFormatter.timeZone = TimeZone(identifier: timezoneIdentifier)

        hourlyDateFormatter.dateFormat = "HH:mm"
        hourlyDateFormatter.timeZone = TimeZone(identifier: timezoneIdentifier)

        hourlyDateFormatterDay.dateFormat = "MMM d"
        hourlyDateFormatterDay.timeZone = TimeZone(identifier: timezoneIdentifier)
    }
}
