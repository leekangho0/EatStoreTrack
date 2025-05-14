//
//  Date+Formatting.swift
//  EatingApp
//
//  Created by 이치훈 on 5/15/25.
//

import Foundation

extension Date {
  // 사용 예) Date.weekdayString(), Date.toDateOnlyString()
  
  // 요일을 한국어로 반환합니다. ex) "월요일"
  func weekdayString(locale: Locale = Locale(identifier: "ko_KR")) -> String {
    let formatter = DateFormatter()
    formatter.locale = locale
    formatter.dateFormat = "EEEE"
    return formatter.string(from: self)
  }
  
  // 날짜만 문자열로 추출. ex) "15"
  func toDateString(format: String = "dd") -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
  
  // "10:30 AM" 형식의 시간 문자열 반환
  func formattedTime12Hour(locale: Locale = Locale(identifier: "en_US")) -> String {
    let formatter = DateFormatter()
    formatter.locale = locale
    formatter.dateFormat = "h:mm a" // 12시간제, AM/PM 포함
    return formatter.string(from: self)
  }
  
}
