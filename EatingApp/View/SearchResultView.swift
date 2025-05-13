//
//  SearchResultView.swift
//  EatingApp
//
//  Created by drfranken on 5/13/25.
//

import SwiftUI

struct SearchResultView: View {
    let keyword: String

    var body: some View {
        VStack {
          Text("HomeView 완성되면 복붙합시다 이 페이지는")
            Text("검색 결과 for: \(keyword)")

        }
        .navigationTitle("검색 결과")
    }
}

#Preview {
    SearchResultView(keyword: "")
}
