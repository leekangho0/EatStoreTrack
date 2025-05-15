//
//  Date+.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import Foundation

extension Date {
  func year() -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy년"
    return formatter.string(from: self)
  }
  
  func month() -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "M월"
    return formatter.string(from: self)
  }
  
  func isSameMonth(with target: Date, calendar: Calendar = .current) -> Bool {
    let currentDate = calendar.dateComponents([.year, .month], from: self)
    let targetDate = calendar.dateComponents([.year, .month], from: target)
    
    return currentDate.year == targetDate.year && currentDate.month == targetDate.month
  }
}
