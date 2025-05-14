//
//  TagManageView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct TagManageView: View {
  @Environment(\.dismiss) var dismiss
  // TODO: defaultValue 없애기
  let categories: [CategoryEntity] = [.food, .drink, .pill]
  @State private var selectedCategory: String = "모두"
  
  var pickerItems: [(emoji: String, name: String)] {
    [
      ("☣️", "모두"),
    ] + categories.map { ($0.emoji, $0.name) }
  }
  
  var body: some View {
    VStack {
      Picker("카테고리 선택", selection: $selectedCategory) {
        ForEach(pickerItems, id: \.name) { category in
          Text("\(category.emoji) \( category.name)")
            .tag(category.name)
        }
      }
      .pickerStyle(.palette)
      .padding()
      
      TagGridView(category: selectedCategory)
    }
    .navigationBarBackButtonHidden(true)
    .navigationDestination(for: TagEntity.self) { tag in
      TagCreateView()
    }
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "chevron.left")
        }
      }
      
      ToolbarItem(placement: .principal) {
        Text("태그 관리")
          .font(.headline)
      }
      
      ToolbarItem(placement: .topBarTrailing) {
        NavigationLink(destination: TagCreateView()) {
          Image(systemName: "plus")
        }
      }
    }
  }
}

struct TagGridView: View {
  @Query var tags: [TagEntity]
  let columns = Array(repeating: GridItem(.flexible()), count: 4)
  
  init(category: String) {
    let predicate = #Predicate<TagEntity> { tag in
      tag.category.name == category || category == "모두"
    }
    _tags = Query(filter: predicate, sort: [SortDescriptor(\TagEntity.name)])
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(tags) { tag in
          NavigationLink(value: tag) {
            VStack(spacing: 0) {
              Text(tag.emoji)
                .font(.largeTitle)
                .padding()
              Text(tag.name)
                .foregroundStyle(.black)
            }
          }
        }
      }
      .padding()
    }
  }
}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    NavigationStack {
      TagManageView()
    }
  }
}
