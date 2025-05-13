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
            Text("검색 결과 for: \(keyword)")

        }
        .navigationTitle("검색 결과")
    }
}

#Preview {
    SearchResultView(keyword: "")
}
