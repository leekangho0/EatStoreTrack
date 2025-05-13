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

    var body: some View {
        VStack {
            TextField("검색어를 입력하세요", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("검색") {
                navigateToResult = true
            }

            NavigationLink(destination: SearchResultView(keyword: searchText), isActive: $navigateToResult) {
                EmptyView()
            }
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
        }
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
}
