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
      ScrollView {
        VStack {
          // 아 맞다 텍스트검색 빼기로했지
          //            TextField("검색어를 입력하세요", text: $searchText)
          //                .textFieldStyle(RoundedBorderTextFieldStyle())
          //                .padding(.horizontal)

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
                .background(selectedTags.contains(tag.id) ? Color.yellow : Color.gray.opacity(0.15))
                .cornerRadius(10)
              }
            }
          }
          .padding(.horizontal)

          Button("검색") {
            navigateToResult = true
          }
          .buttonStyle(.borderedProminent)
        }
        .navigationDestination(isPresented: $navigateToResult) {
          SearchResultView(selectedTags: selectedTags)
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
            Text("태그 검색")
              .font(.headline)
          }
        }
      }
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
