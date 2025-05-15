////
////  SearchResultView.swift
//  EatingApp
//
//  Created by drfranken on 5/13/25.
//

// TODO: 검색조건은 OR 로 합시다


import SwiftUI

struct SearchResultView: View {
  let selectedTags: [TagEntity]
  let text: String

  var body: some View {
    NavigationStack {
      VStack {
        FeedListView(selectedTag: selectedTags, text: text)
      }
    }
  }
}

#Preview {
  NavigationStack {
//    SearchResultView(selectedTags: Set([1, 2, 3]))
  }
}
