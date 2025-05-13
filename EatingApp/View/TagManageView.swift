//
//  TagManageView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct TagManageView: View {
  @Environment(\.dismiss) var dismiss
  @State private var selectedCategory: Int = 0

  var body: some View {

    VStack {

      Picker("카테고리 선택", selection: $selectedCategory) {
        Text("☣️모두").tag(0)
        ForEach(sampleCategories) { category in
          Text("\(category.emoji) \( category.name)").tag(category.id)
        }
      }
      .pickerStyle(.palette)
      .padding()

      let filteredTags = selectedCategory == 0
      ? sampleTags
      : sampleTags.filter { $0.category_id == selectedCategory }

      List(filteredTags) { tag in
        Text("\(tag.emoji) \(tag.name)")
      }
    }
    .navigationBarBackButtonHidden(true)
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

#Preview {
  NavigationStack {
    TagManageView()
  }
}
