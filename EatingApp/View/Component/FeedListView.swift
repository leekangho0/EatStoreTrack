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
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        ForEach(items) { item in
          FeedContentView(item: item, deleteAction: onDelete)
        }
      } //: VStack
      .padding(.horizontal, 20)
    } //: ScrollView
  } //: body
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
    ZStack {
      Rectangle()
        .fill(Color("pYellow"))
        .frame(height: 300)
      
      HStack {
        Category(rawValue: item.category)?.icon
        Text(item.content)
      }
      
      HStack {
        Spacer()
          .frame(maxWidth: .infinity)
        
        Button {
          deleteAction(item)
        } label: {
          Image(systemName: "trash")
            .foregroundColor(.primary)
        }
        .background(Color("pYellow"))
      }
    } //: ZStack
  } //: body
  
}
