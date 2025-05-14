//
//  SearchResultView.swift
//  EatingApp
//
//  Created by drfranken on 5/13/25.
//

// TODO: 검색조건은 OR 로 합시다


import SwiftUI

struct SearchResultView: View {
  @Environment(\.dismiss) var dismiss
  let selectedTags: Set<Int>

  var body: some View {
    VStack {
      Text("이 페이지는\nHomeView 완성되면 복붙합시다 ")
      Text("선택된 태그 id: \(selectedTags)")

    }
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .navigationBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "chevron.left")
        }
      }

      ToolbarItem(placement: .principal) {
        Text("검색 결과")
          .font(.headline)
      }
    }
  }
}

#Preview {
  NavigationStack {
    SearchResultView(selectedTags: Set([1, 2, 3]))
  }
}
