//
//  SearchView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct SearchView: View {
  @Environment(\.dismiss) var dismiss
  @State private var searchText = ""
  @State private var navigateToResult = false
  @State var selectedTags: Set<Int> = []

  var body: some View {
    ZStack {
      Color.pBack1
        .ignoresSafeArea()

      VStack {
        Spacer().frame(minHeight: 20, maxHeight: 30)
        ScrollView {
          VStack {

            let columns = Array(repeating: GridItem(.flexible()), count: 4)

            LazyVGrid(columns: columns, spacing: 12) {
              ForEach(sampleTags) { tag in
                Button(action: {
                  if selectedTags.contains(tag.id) {
                    selectedTags.remove(tag.id)
                  } else {
                    selectedTags.insert(tag.id)
                  }
                }) {
                  VStack(spacing: 2) {
                    Text(tag.emoji)
                      .font(.largeTitle)

                    Text(tag.name)
                      .font(.caption2)
                  }
                  .frame(width: 70, height: 70)
                  .foregroundStyle(selectedTags.contains(tag.id) ? Color.pWhiteBlack : Color.accentColor)
                  .background(selectedTags.contains(tag.id) ? Color.pAccent2 : Color.pWhiteBlack)
                  .cornerRadius(10)
                  .compositingGroup()
                  .shadow(color: Color.pShadow.opacity(0.2), radius: 4, y:2)
                }
              }
            }
            .padding(.horizontal)


          }
          .navigationDestination(isPresented: $navigateToResult) {
            SearchResultView(selectedTags: selectedTags)
          }
        }
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
//        .buttonStyle(.borderedProminent)
        
      }
    }
//    .navigationTitle("검색")
    .toolbar {
      ToolbarItem(placement: .principal) {
        Text("검색")
          .foregroundColor(.primary)
          .font(.system(size: 25, weight: .bold))
      }
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
