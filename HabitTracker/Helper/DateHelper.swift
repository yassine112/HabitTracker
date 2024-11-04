//
//  DateHelper.swift
//  Expense Tracker
//
//  Created by Yassine on 31/10/2024.
//

import Foundation

extension Date {
    var istoday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    var dayOfWeek: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"  // Short day format
        return formatter.string(from: self)
    }
    
    var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"  
        return formatter.string(from: self)
    }
}
