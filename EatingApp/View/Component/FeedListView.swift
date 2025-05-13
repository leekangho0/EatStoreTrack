//
//  FeedListView.swift
//  EatingApp
//
//  Created by kangho lee on 5/13/25.
//

import SwiftUI
import SwiftData

struct FeedListView: View {
  @Environment(\.modelContext) var modelContext
  
  @Query(sort: \FeedEntity.createdDate)
  var items: [FeedEntity]
  @State var showDelete = false
  
  var body: some View {
    List {
      ForEach(items) { item in
        FeedContentView(item: item, deleteAction: onDelete)
      }
    }
  }
}

extension FeedListView {
  private func onDelete(_ item: FeedEntity) {
    modelContext.delete(item)
  }
}

#Preview {
  ModelContainerPreview(ModelContainer.samples) {
    FeedListView()
  }
}


struct FeedContentView: View {
  let item: FeedEntity
  let deleteAction: (FeedEntity) -> ()
  
  var body: some View {
    HStack {
      Text(item.category.emoji)
      Text(item.content)
    }
    HStack {
      Spacer()
        .frame(maxWidth: .infinity)
      
      Button {
        deleteAction(item)
      } label: {
        Image(systemName: "trash")
      }
      .background(.yellow)
    }
  }
}
