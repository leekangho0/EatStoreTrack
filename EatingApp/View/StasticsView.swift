//
//  StasticsView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct StasticsView: View {
  @Environment(\.dismiss) var dismiss
  @Query var feeds: [FeedEntity]
  
  @State var isMonthly: Bool = true // 월간이면 true 주간이면 false
  @State var selectedCategory: CategoryFilter = .all
  
  @State var weekOffset: Int = 0 // 현재시점에서 몇주 이동했는지
  
  // TODO: 데이터 가져올 때는 월간이던 주간이던 이 두개랑 카테고리만 이용해서 가져오면 됩니다
  @State var startDate: Date = Date()
  @State var endDate: Date = Date()
  
  var body: some View {
    ScrollView {
      Picker("월간주간 선택", selection: $isMonthly) {
        Text("월간")
          .tag(true)
        Text("주간")
          .tag(false)
      }
      .pickerStyle(.palette)
      .padding()
      
      VStack {
        VStack(spacing: 20) {
          HYearMonthPickerView(startDate: startDate, endDate: endDate, weekOffset: $weekOffset, isMonthly: isMonthly)
          
          VStack(alignment: .leading) {
            HStack {
              StatisticsHeaderView(selectedCategory: $selectedCategory)
              Text(rankingName)
                .font(.largeTitle)
                .foregroundStyle(Color.pText)
                .fontWeight(.heavy)
                .padding(.horizontal)
            }
            
            Rectangle()
              .frame(height: 1)
              .foregroundStyle(Color.pText)
          }
          
          Text("이 기간동안 총 \(feedCount)개 기록했어요")
            .foregroundStyle(Color.accentColor)
            .padding(20)
          .frame(maxWidth: .infinity)
          .background(RoundedRectangle(cornerRadius: 16).foregroundColor(Color.white.opacity(0.9)))
          if filteredFeeds.isEmpty {
            ContentUnavailableView("오늘 하루 먹은 걸 기록해보세요!", systemImage: "spoon.serving", description: Text("식사, 간식, 음료 모두"))
              .foregroundStyle(.accent)
          } else {
            VStack {
              HStack {
                Text("가장 많이 작성한 요일")
                  .font(.title3)
                  .bold()
                  .foregroundStyle(.accent)
                Spacer()
              }
              ForEach(dailyUsage()) { rank in
                HStack {
                  RankRow(rank: rank)
                }
              }
            }
            .padding(10)
            
            
            VStack {
              HStack {
                Text("가장 많이 사용한 태그")
                  .font(.title3)
                  .bold()
                  .foregroundStyle(.accent)
                Spacer()
              }
              ForEach(rank()) { rank in
                HStack {
                  RankRow(rank: rank)
                }
              }
            }
            .padding(10)
          }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(Color.pYellow)
        )
        .shadow(color: Color.pShadow.opacity(0.2), radius: 4, y:2)
        .ignoresSafeArea(edges: .bottom)
        
        Spacer()
      }
      .padding(.horizontal, 20)
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("보고서")
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
    .background(Color.pBack1)
  }
}

extension StasticsView {
  
  private var filteredFeeds: [FeedEntity] {
    return feeds
      .filter { $0.createdDate >= startDate && $0.createdDate <= endDate && selectedCategory.id == CategoryFilter.all.id ? true : $0.category == selectedCategory.name }
  }
  
  private func rank() -> [Rank] {
    let feedTagsArray = filteredFeeds
      .map(\.tags)
    
    var dict = [TagEntity: Int]()
    
    feedTagsArray.forEach { tags in
      tags.forEach { tag in
        dict[tag, default: 0] += 1
      }
    }
    
    let sorted = dict
      .sorted { $0.value > $1.value }
      
    let ranks = sorted
      .enumerated()
      .map { value in
        Rank(value.offset + 1, value.element.key.name, value.element.key.emoji, value.element.value)
      }.prefix(3)
        return Array(ranks)
  }
  
  struct DailyUsage: Ranking {
    let rank: Int
    let day: String
    let count: Int
    
    var id: String { day }
    var value: String { day }
  }
  
  private func dailyUsage() -> [DailyUsage] {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "ko_KR")
    dateFormatter.dateFormat = "E"
    
    let dates = filteredFeeds
      .map(\.createdDate)
      .map(dateFormatter.string(from:))
    
    let result = dates.reduce(into: [String: Int]()) { partialResult, value in
      partialResult[value, default: 0] += 1
    }
    let sorted = result.sorted { $0.value > $1.value }
    
    let daily = sorted
      .enumerated()
      .map { offset, element in
        DailyUsage(rank: offset + 1, day: element.key, count: element.value)
      }.prefix(3)
    
    return Array(daily)
  }
  
  private var feedCount: Int {
    filteredFeeds.count
  }
  
  private var rankingName: String {
    isMonthly ? "월간 랭킹" : "주간 랭킹"
  }
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
}

protocol Ranking: Identifiable {
  var value: String { get }
  var rank: Int { get }
  var count: Int { get }
}

extension Ranking {
  var id: Int { rank }
}

fileprivate struct StatisticsHeaderView: View {
  @Binding var selectedCategory: CategoryFilter
  
  var body: some View {
    VStack {
      
      Menu {
        ForEach(CategoryFilter.allCases) { category in
          Button {
            selectedCategory = category
          } label: {
            HStack {
              category.icon
                .resizable()
                .frame(width: 50, height: 50)
              Text(category.name)
            }
          }
        }
      } label: {
        HStack {
          selectedCategory.icon
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
        }
        .background(
          RoundedRectangle(cornerRadius: 20)
            .frame(width: 80, height: 80)
            .foregroundColor(Color.pWhiteBlack.opacity(0.9))
        )
        .compositingGroup()
        .shadow(color: Color.pShadow.opacity(0.3), radius: 4, y:2)
      }
    }
  }
}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    NavigationStack {
      StasticsView()
    }
  }
}
/**
 주간 날짜 구하기 코드
 */
