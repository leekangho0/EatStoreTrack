//
//  SearchView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct SearchView: View {
  @Environment(\.dismiss) var dismiss
  @State private var searchText = ""
  @State private var navigateToResult = false
  @Query var tags: [TagEntity]
  @State var selectedTags: Set<TagEntity> = []

  var body: some View {
    ZStack {
      Color.pBack1
        .ignoresSafeArea()

      VStack {
        Spacer().frame(minHeight: 20, maxHeight: 30)
        TextField("키위소스듬뿍김밥", text: $searchText)
          .padding(10)
          .background(
            RoundedRectangle(cornerRadius: 8)
              .fill(Color.pWhiteBlack.opacity(0.7))
          )
          .padding()
      }
      VStack {
        Spacer()
        Button {
          navigateToResult = true
        } label: {
          Image(systemName: "magnifyingglass")
            .font(.largeTitle)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .padding(.vertical, 4)
            .background(.pAccent2)
            .clipShape(.buttonBorder)
        }
        .padding(20)
      }
    }
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("검색")
          .foregroundColor(.primary)
          .font(.system(size: 25, weight: .bold))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .navigationDestination(isPresented: $navigateToResult) {
      SearchResultView(selectedTags: Array(selectedTags), text: searchText)
    }
  }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}

struct TagSelectView: View {
  let columns = Array(repeating: GridItem(.flexible()), count: 4)
  @Binding var selectedTags: Set<TagEntity>
  let tags: [TagEntity]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 12) {
        ForEach(tags) { tag in
          Button(action: {
            if selectedTags.contains(tag) {
              selectedTags.remove(tag)
            } else {
              selectedTags.insert(tag)
            }
          }) {
            VStack(spacing: 2) {
              Text(tag.emoji)
                .font(.largeTitle)
              
              Text(tag.name)
                .font(.caption2)
            }
            .frame(width: 70, height: 70)
            .foregroundStyle(selectedTags.contains(tag) ? Color.pWhiteBlack : Color.accentColor)
            .background(selectedTags.contains(tag) ? Color.pAccent2 : Color.pWhiteBlack)
            .cornerRadius(10)
            .compositingGroup()
            .shadow(color: Color.pShadow.opacity(0.2), radius: 4, y:2)
          }
        }
      }
      .padding(.horizontal)
    }
  }
}
