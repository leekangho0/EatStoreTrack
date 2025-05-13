//
//  FeedWriteView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct FeedWriteView: View {
  var body: some View {
    VStack {
      FeedWriteTagSelectView()
    }
  } //: body
}

// MARK: FeedWriteTagSelectView
struct FeedWriteTagSelectView: View {
  
  // TODO: SwiftData Tag값 load, Feed값 upLoad
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 5)
        .fill(.gray)
        .frame(maxWidth: .infinity, minHeight: 150)
      
      Grid {
        GridRow {
          TagButtonView(emoji: "😊", tagName: "방긋")
          TagButtonView(emoji: "😊", tagName: "방긋")
        }
      } //: Grid
    } //: ZStack
  } //: Body
}

// MARK: TagButtonView
struct TagButtonView: View {
  
  var emoji: String
  var tagName: String
  
  var body: some View {
    Button {
      
    } label: {
      VStack {
        Text(emoji)
        
        Text(tagName)
          .foregroundColor(.primary)
      }
    }
  } //: body
}

#Preview {
  FeedWriteView()
}
