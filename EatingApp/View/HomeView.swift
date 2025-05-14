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
  @Query var categories: [CategoryEntity]
  @Environment(\.modelContext) private var modelContext
  
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
            CategoryPopUpView(categories: categories)
              .padding(.bottom, 60)
          }
        }
      }
      .navigationTitle("Home")
      .navigationDestination(for: CategoryEntity.self, destination: { category in
        FeedWriteView(selectedCategoryEntity: category)
      })
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
      } //: ZStack
      .onAppear {
//        if categories.isEmpty {
//          insertSampleCategories()
//          //deleteAllCategories()
//        }
      }
    } //: NavigationStack
  } //: body
  
//  private func insertSampleCategories() {
//    let samples: [(String, String, String)] = [
//      ("먹을거", "📚", "study"),
//      ("마실거", "🏃‍♂️", "exercise"),
//      ("영양제", "📖", "reading")
//    ]
//    
//    for (name, emoji, imageName) in samples {
//      let category = CategoryEntity(name: name, emoji: emoji, imageName: imageName)
//      modelContext.insert(category)
//    }
//    
//    do {
//      try modelContext.save()
//      print("✅ 샘플 카테고리 저장 완료")
//    } catch {
//      print("❌ 샘플 저장 실패: \(error)")
//    }
//  }
  
//  private func deleteAllCategories() {
//      for category in categories {
//          modelContext.delete(category)
//      }
//
//      do {
//          try modelContext.save()
//          print("🗑️ 모든 카테고리 삭제 완료")
//      } catch {
//          print("❌ 삭제 실패: \(error)")
//      }
//  }

}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    HomeView()
  }
}

fileprivate struct CategoryPopUpView: View {
  let categories: [CategoryEntity]
  
  var body: some View {
    HStack(spacing: 30) {
      ForEach(categories) { category in
        NavigationLink(value: category) {
          VStack {
            Text(category.emoji)
              .font(.largeTitle)
            
            Text(category.name)
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
