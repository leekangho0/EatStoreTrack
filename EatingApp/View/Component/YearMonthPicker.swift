//
//  YearMonthPicker.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import SwiftUI

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
}

struct YearMonthPickerView: View {
  @Binding var selectedDate: Date
  @Environment(\.dismiss) var dismiss
  
  let months: [String]
  let columns = [GridItem(.adaptive(minimum: 80))]
  
  init(selectedDate: Binding<Date>) {
    _selectedDate = selectedDate
    var calendar = Calendar.current
    calendar.locale = Locale(identifier: "ko_KR")
    self.months = calendar.shortMonthSymbols
  }

  var body: some View {
    VStack {
      HStack {
        Image(systemName: "chevron.left")
          .frame(width: 24.0)
          .onTapGesture {
            if let value = Calendar.current.date(byAdding: .year, value: -1, to: selectedDate) {
//              print("value:\(value)")
              selectedDate = value
              print(selectedDate)
            }
          }

        Text(selectedDate.year())
          .fontWeight(.bold)
          .transition(.move(edge: .trailing))

        Image(systemName: "chevron.right")
          .frame(width: 24.0)
          .onTapGesture {
            if let value = Calendar.current.date(byAdding: .year, value: 1, to: selectedDate) {
              selectedDate = value
            }
          }
      }
//
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(months, id: \.self) { item in
          Text(item)
            .font(.headline)
            .frame(width: 60, height: 33)
            .bold()
            .background(item == selectedDate.month() ? Color(.accent) : Color(.pYellow))
            .foregroundStyle(item == selectedDate.month() ? .white : .black)
            .cornerRadius(8)
            .onTapGesture {
              var calender = Calendar.current
              calender.locale = Locale(identifier: "ko_KR")
              var dateComponent = DateComponents()
              dateComponent.day = 1
              dateComponent.month = months.firstIndex(of: item)! + 1
              dateComponent.year = calender.component(.year, from: selectedDate)
              print(selectedDate.year())
              print(months.firstIndex(of: item)! + 1)
              if let value = calender.date(from: dateComponent) {
                selectedDate = value
                print(value)
              }
              
              dismiss()
            }
        }
      }
    }
    .padding()
    .padding(.vertical)
    .background(.pBack1)
  }
}

#Preview {
  YearMonthPickerView(selectedDate: .constant(Date()))
}
