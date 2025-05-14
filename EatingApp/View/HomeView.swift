//
//  HomeView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
  
  @State var showPopup = false
  
  var body: some View {
    NavigationStack {
      ZStack {
        VStack {
          FeedListView()
          
          Button {
            withAnimation {
              showPopup.toggle()
            }
          } label: {
            Text("새글작성")
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.blue)
              .foregroundColor(.white)
              .clipShape(Capsule())
              .padding(.horizontal)
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
      .navigationTitle("Home")
      .navigationDestination(for: Category.self) { category in
        VStack {
          Text(category.rawValue)
        }
      }
      .toolbar {
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
      }
    }
  }
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
