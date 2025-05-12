//
//  TagManageView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct TagManageView: View {


    var body: some View {

        VStack {
            Text("태그 관리 뷰임요")

            VStack {
                List(sampleTags) { tag in
                    Text("\(tag.emoji) \(tag.name)")
                }
            }
        }
        .toolbar {
            
        }
    }
}

#Preview {
    NavigationStack {
        TagManageView()
    }
}
