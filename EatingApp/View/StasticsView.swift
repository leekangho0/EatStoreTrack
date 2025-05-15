//
//  StasticsView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct StasticsView: View {
  @Environment(\.dismiss) var dismiss

  @State var isMonthly: Bool = true // 월간이면 true 주간이면 false
  @State var selectedCategory: Int = 0

  @State var weekOffset: Int = 0 // 현재시점에서 몇주 이동했는지


  // TODO: 데이터 가져올 때는 월간이던 주간이던 이 두개랑 카테고리만 이용해서 가져오면 됩니다
  @State var startDate: Date = Date()
  @State var endDate: Date = Date()

  var feedCount: Int = 0


  // startDate 와 endDate 를 계산해주는 함수
  func updateDateRange() {
    let calendar = Calendar.current
    let today = Date()

    if isMonthly {
      let thisMonth = calendar.date(byAdding: .month, value: weekOffset, to: today)!
      let components = calendar.dateComponents([.year, .month], from: thisMonth)
      startDate = calendar.date(from: components)!

      var comps = DateComponents()
      comps.month = 1
      comps.day = -1
      endDate = calendar.date(byAdding: comps, to: startDate)!
    } else {
      var startOfWeek = calendar.date(from: calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: today))!
      if weekOffset != 0 {
        startOfWeek = calendar.date(byAdding: .weekOfYear, value: weekOffset, to: startOfWeek)!
      }
      startDate = startOfWeek
      endDate = calendar.date(byAdding: .day, value: 6, to: startOfWeek)!
    }
  }

  var body: some View {
    ZStack {
      Color.pBack1
        .ignoresSafeArea()

      VStack {

        VStack(spacing: 20) {

          Text("월간/주간 랭킹")
            .font(.largeTitle)
            .foregroundStyle(Color.pText)
            .fontWeight(.heavy)

          Rectangle()
            .frame(height: 3)
            .foregroundStyle(Color.pText)

          HStack {
            Picker("월간주간 선택", selection: $isMonthly) {
              Text("월간")
                .tag(true)
              Text("주간")
                .tag(false)
            }
            .pickerStyle(.palette)
            .padding()


            Spacer()

            Menu {
              Button {
                selectedCategory = 0
              } label: {
                HStack {
                  Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                  Text("전체")
                }
              }

              ForEach(sampleCategories) { category in
                Button {
                  selectedCategory = category.id
                } label: {
                  HStack {
                    Image(category.imageName)
                      .resizable()
                      .frame(width: 50, height: 50)
                    Text(category.name)
                  }
                }
              }
            } label: {
              HStack(spacing: 0) {
                if selectedCategory == 0 {
                  Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                } else {
                  Image(sampleCategories.first(where: { $0.id == selectedCategory })?.imageName ?? "questionmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                }
              }
              .background(
                RoundedRectangle(cornerRadius: 20)
                  .frame(width: 80, height: 80)
                  .foregroundColor(Color.pWhiteBlack.opacity(0.5))
              )
              .compositingGroup()
              .shadow(color: Color.pShadow.opacity(0.3), radius: 4, y:2)
            }

          }
          .frame(height: 50)


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
                  .font(.title3)


                Button {
                  weekOffset += 1
                } label: {
                  Image(systemName: "chevron.right")
                    .paddedBackgroundStyle()
                }
              }
            }

            HStack {
              Spacer()
              Text("이 기간동안 총 \(feedCount)개 기록했어요")
              Spacer()
            }
            .padding(20)
            .foregroundStyle(Color.accentColor)
            .background(RoundedRectangle(cornerRadius: 16)
            .foregroundColor(Color.pBack1.opacity(0.5)))


//            VStack {
//              Text("디버깅용")
//              Text("startDate: \(DateFormatter.localizedString(from: startDate, dateStyle: .medium, timeStyle: .none))")
//              Text("endDate: \(DateFormatter.localizedString(from: endDate, dateStyle: .medium, timeStyle: .none))")
//            }
          }
          .foregroundStyle(Color.accentColor)
          .tint(Color.accentColor)


          ScrollView {


            // TODO: 데이터를 실시간으로 계산해서 가져올건데, 어떤 형식으로 가져올지 고민필요. 일단 이렇게 만듬
            let sampleTopRanks: [(rank: Int, name: String, emoji: String, count: Int)] = [
              (1, "토끼", "🐰", 10),
              (2, "강아지", "🐶", 9),
              (3, "고양이", "🐱", 8),
              (4, "여우", "🦊", 7),
              (5, "곰", "🐻", 6),
              (6, "판다", "🐼", 5),
              (7, "코알라", "🐨", 4),
              (8, "호랑이", "🐯", 3),
              (9, "사자", "🦁", 2),
              (10, "돼지", "🐷", 1)
            ]

            ForEach(sampleTopRanks, id: \.rank) { rank in
              HStack {
                Text("\(rank.rank)위 ")
                  .font(.largeTitle)
                  .foregroundStyle(Color.white)

                Spacer()

                Group {
                  Text("\(rank.emoji)")
                  Text("\(rank.name)").font(.title3)
                  Spacer().frame(width: 20)
                  Text("\(rank.count)회")
                }
                .font(.title)
                .foregroundStyle(Color.white)
//

              }
              .padding(10)
              .padding(.horizontal, 20)
              .frame(maxWidth: .infinity)
              .background {
                RoundedRectangle(cornerRadius: 18)
                  .fill(Color.pAccent2.opacity(0.9))
//                  .fill(.pBack1.opacity(0.5))
                  .compositingGroup()
                  .shadow(color: Color.pShadow.opacity(0.2), radius: 2, y:1)
              }
            }
          }
          .padding(10)






        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 500)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(Color.pYellow)
        )
        .compositingGroup()
        .shadow(color: Color.pShadow.opacity(0.2), radius: 4, y:2)
        .ignoresSafeArea(edges: .bottom)

      }
      .padding(.horizontal, 20)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("통계")
            .foregroundColor(.primary)
            .font(.system(size: 25, weight: .bold))
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .onAppear {
        updateDateRange()
      }
      .onChange(of: isMonthly) { _, _ in
        updateDateRange()
      }
      .onChange(of: weekOffset) { _, _ in
        updateDateRange()
      }

    }

  }
}

#Preview {
  NavigationStack {
    StasticsView()
  }
}



// 중복제거용 모디파이어 따로 빼기
struct PaddedBackgroundStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.horizontal, 16)
      .frame(height: 30)
      .background(Color.pWhiteBlack.opacity(0.5))
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .compositingGroup()
      .shadow(color: Color.pShadow.opacity(0.3), radius: 4, y:2)
  }
}

extension View {
  func paddedBackgroundStyle() -> some View {
    self.modifier(PaddedBackgroundStyle())
  }
}



/**
 주간 날짜 구하기 코드
 */
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
