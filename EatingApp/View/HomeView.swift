//
//  HomeView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  
  @Query(sort: \FeedEntity.createdDate, order: .reverse) var feeds: [FeedEntity]
  
  @State var selectedYear = Date()
  @State var isSelectedPlusButton: Bool = false
  @State var seletedCategory: Category?
  @State var showCalendar = false
  
  var body: some View {
    NavigationStack {
      VStack {
      FeedListView()
        .padding(.top, 20)
      }
      .overlay {
        VStack(alignment: .trailing) {
          Spacer()
            Button {
              withAnimation {
                isSelectedPlusButton.toggle()
              }
            } label: {
              Image(systemName: "plus.circle.fill")
                .resizable()
                .scaledToFit()
                .background(.white.opacity(0.3))
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(isSelectedPlusButton ? 90 : .zero))
                .animation(.easeInOut(duration: 0.2), value: isSelectedPlusButton)
                .clipShape(.circle)
                .shadow(radius: Metric.cornerRadius)
            }
            .padding([.trailing, .bottom], 30)
            .frame(maxWidth: .infinity, alignment: .trailing)
          }
      }
      .background(.pBack1)
      .navigationDestination(item: $seletedCategory) { category in
        FeedWriteView(category: category)
      }
      .sheet(isPresented: $showCalendar) {
        YearMonthPickerView(selectedDate: $selectedYear)
          .presentationDetents([.fraction(0.3)])
          .presentationCornerRadius(Metric.cornerRadius * 2)
      }
      .fullScreenCover(isPresented: $isSelectedPlusButton) {
        FadeOutSheetView {
          CategoryPopUpView(item: $seletedCategory)
            .padding(.bottom, 90)
        }
      }
      .transaction {
        $0.disablesAnimations = true
      }
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          HStack {
            VStack(alignment: .leading, spacing: -3) {
              Text(selectedYear.year())
                .font(.callout)
              Text(selectedYear.month())
                .font(.title)
            }
            .padding(.vertical)
            .padding(.leading)
            
            Image(systemName: "chevron.right")
              .resizable()
              .scaledToFit()
              .frame(width: 25, height: 25)
              .fontWeight(.bold)
          }
          .foregroundColor(.primary)
          .onTapGesture {
            showCalendar.toggle()
          }
        }
        
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          NavigationLink(destination: StasticsView()) {
            Image(systemName: "chart.pie")
          }
          NavigationLink(destination: TagManageView()) {
            Image(systemName: "tag")
          }
          NavigationLink(destination: SearchView()) {
            Image(systemName: "magnifyingglass")
          }
        }
      } //: ZStack
    } //: NavigationStack
  } //: body
  
}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    HomeView()
  }
}

fileprivate struct CategoryPopUpView: View {
  @Binding var item: Category?
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    HStack(spacing: 30) {
      ForEach(Category.allCases) { category in
        Button {
          item = category
          dismiss()
        } label: {
          category.icon
            .resizable()
            .scaledToFit()
            .frame(width: 80, height:80)
        }
      }
    }
    .padding()
    .background(.ultraThinMaterial)
    .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
    .shadow(radius: Metric.shadowRadius)
    .transition(.move(edge: .bottom).combined(with: .opacity))
  }
}
