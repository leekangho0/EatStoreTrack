//
//  HomeView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  
  @Query var feeds: [FeedEntity]
  @State var showPopup = false
  @State var selectedYear = Calendar.current.component(.year, from: Date())
  @State var selectedMonth = Calendar.current.component(.month, from: Date())
  @State var isSelectedPlusButton: Bool = false
  
  let menuYears = Array(2020...2030)
  let menuMonths = Array(1...12)
  
  
  init() {
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        ZStack {
          FeedListView()
            .padding(.top, 40)
          
          VStack {
            Spacer()
            
            Button {
              withAnimation {
                showPopup.toggle()
                isSelectedPlusButton.toggle()
              }
            } label: {
              Image("plus")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(isSelectedPlusButton ? 90 : .zero))
                .animation(.easeInOut(duration: 0.2), value: isSelectedPlusButton)
            }
            
            
          }
        }
        
        if showPopup {
          Color.black.opacity(0.3)
            .ignoresSafeArea()
            .onTapGesture {
              withAnimation {
                showPopup = false
              }
            }
        }
        
        if showPopup {
          VStack {
            Spacer()
            CategoryPopUpView()
              .padding(.bottom, 60)
          }
        }
      }
//      .navigationTitle("Home")
      .navigationDestination(for: Category.self) { category in
        FeedWriteView(category: category)
      }
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarLeading) {
          VStack(alignment: .leading, spacing: -5) {
            Menu {
              ForEach(menuYears, id: \.self) { year in
                Button("\(String(year)) 년") {
                  self.selectedYear = year
                }
              }
            } label: {
              Text("\(String(selectedYear))년")
                .font(.system(size: 20))
            }
            
            Menu {
              ForEach(menuMonths, id: \.self) { month in
                Button("\(month) 월") {
                  self.selectedMonth = month
                }
              }
            } label: {
              Text("\(selectedMonth)월")
                .font(.system(size: 30))
            }
          }
          .foregroundColor(.primary)
          .padding(.leading, 20)
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

extension HomeView {
  
}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    HomeView()
  }
}

fileprivate struct CategoryPopUpView: View {
  
  var body: some View {
    HStack(spacing: 30) {
      ForEach(Category.allCases) { category in
        NavigationLink(value: category) {
          VStack {
            category.icon
          }
        }
      }
    }
    .padding()
    .background(.ultraThinMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .shadow(radius: 10)
    .transition(.move(edge: .bottom).combined(with: .opacity))
  }
}
