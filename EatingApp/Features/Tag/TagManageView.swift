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

  @State private var selectedCategory: String = "All"
  @State private var selectedTag: TagEntity?
  @State private var showNewTag = false
  
  var body: some View {
    ZStack {
      Color.pBack1
        .ignoresSafeArea()

      VStack {
        Picker("카테고리 선택", selection: $selectedCategory) {
          Text("All").tag("All")
          ForEach(Category.allCases) { category in
            Text(category.rawValue)
              .tag(category.rawValue)
          }
        }
        .pickerStyle(.palette)
        .padding()
        TagGridView(category: selectedCategory, selectedTag: $selectedTag)
      }
      .navigationBarTitleDisplayMode(.inline)
      .sheet(isPresented: $showNewTag, content: {
        TagCreateView(tag: nil)
          .presentationDragIndicator(.visible)
          .presentationDetents([.large, .large])
          .presentationBackground(Color.pBack1)
      })
      .sheet(item: $selectedTag, content: { tag in
        TagCreateView(tag: tag)
          .presentationDragIndicator(.visible)
          .presentationDetents([.large, .large])
          .presentationBackground(Color.pBack1)
      })
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("태그 관리")
            .foregroundColor(.primary)
            .font(.system(size: 25, weight: .bold))
        }
        
        
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showNewTag.toggle()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
    }
  }
}

struct TagGridView: View {
  @Query var tags: [TagEntity]
  @Binding private var selectedTag: TagEntity?
  
  let columns = Array(repeating: GridItem(.flexible()), count: 4)
  
  init(category: String, selectedTag: Binding<TagEntity?>) {
    let predicate = #Predicate<TagEntity> { tag in
      tag.category == category || category == "All"
    }
    _tags = Query(filter: predicate, sort: [SortDescriptor(\TagEntity.name)])
    _selectedTag = selectedTag
  }
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(tags) { tag in
          Button {
            selectedTag = tag
          } label: {
            VStack(spacing: -12) {
              Text(tag.emoji)
                .font(.largeTitle)
                .padding()
              Text(tag.name)
                .font(.caption)
                .foregroundStyle(.primary)
                .padding(.bottom, 4)
            }
            .padding(.horizontal, 4)
            .aspectRatio(1.0, contentMode: .fit)
            .background(RoundedRectangle(cornerRadius: 16)
              .fill(Color.pWhiteBlack))
            .compositingGroup()
            .shadow(color: Color.pShadow.opacity(0.2), radius: 3, y:3)

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
