//
//  SampleView.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import SwiftUI
import SwiftData

struct SampleFeedsView: View {
  @Environment(\.modelContext) private var modelContext
  
  @Query(sort: \FeedEntity.createdDate)
  private var feeds: [FeedEntity]
  
  var body: some View {
    List {
      ForEach(feeds) { feed in
        HStack {
          VStack {
            
          }
          
          VStack(alignment: .leading) {
            Text(feed.content)
            
            Text(feed.tagsValue)
            
            RoundedRectangle(cornerRadius: 12)
              .frame(height: 100)
              .foregroundStyle(.secondary)
          }
          .padding()
        }
      }
    }
  }
}

extension FeedEntity {
  var tagsValue: String {
    tags.map(\.emoji).reduce("") {
      $0 + " " + $1
    }
  }
}

#Preview {
  SampleFeedsView()
    .modelContainer(try! ModelContainer.samples())
}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    SampleFeedsView()
  }
}
