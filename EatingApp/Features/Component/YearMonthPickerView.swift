//
//  YearMonthPickerView.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import SwiftUI

struct HYearMonthPickerView: View {
  let startDate: Date
  let endDate: Date
  @Binding var weekOffset: Int
  
  let isMonthly: Bool
  
  var body: some View {
    VStack{
      Text(dynamicYearLabel(from: startDate, to: endDate))
        .paddedBackgroundStyle()
        .font(.title3)

      if isMonthly {
        HStack {
          Button {
            weekOffset -= 1
          } label: {
            Image(systemName: "chevron.left")
              .paddedBackgroundStyle()
          }

          Text(monthLabel(from: startDate))
            .paddedBackgroundStyle()
            .font(.title3)

          Button {
            weekOffset += 1
          } label: {
            Image(systemName: "chevron.right")
              .paddedBackgroundStyle()
          }
        }
      } else {
        HStack {
          Button {
            weekOffset -= 1
          } label: {
            Image(systemName: "chevron.left")
              .paddedBackgroundStyle()
          }

          Text(dateRangeLabel(from: startDate, to: endDate))
            .paddedBackgroundStyle()
            .font(.callout)


          Button {
            weekOffset += 1
          } label: {
            Image(systemName: "chevron.right")
              .paddedBackgroundStyle()
          }
        }
      }


//            VStack {
//              Text("디버깅용")
//              Text("startDate: \(DateFormatter.localizedString(from: startDate, dateStyle: .medium, timeStyle: .none))")
//              Text("endDate: \(DateFormatter.localizedString(from: endDate, dateStyle: .medium, timeStyle: .none))")
//            }
    }
    .foregroundStyle(Color.accentColor)
    .tint(Color.accentColor)
  }
  
  func dateRangeLabel(from start: Date, to end: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "M월 d일"
    return "\(formatter.string(from: start)) ~ \(formatter.string(from: end))"
  }

  func monthLabel(from date: Date) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "M월"
    return formatter.string(from: date)
  }

  /// 연도 라벨 동적 생성 함수: 같은 연도면 "2025년", 다르면 "2024년 ~ 2025년"
  func dynamicYearLabel(from start: Date, to end: Date) -> String {
    let calendar = Calendar.current
    let startYear = calendar.component(.year, from: start)
    let endYear = calendar.component(.year, from: end)

    if startYear == endYear {
      return "\(startYear)년"
    } else {
      return "\(startYear)년 ~ \(endYear)년"
    }
  }
}
