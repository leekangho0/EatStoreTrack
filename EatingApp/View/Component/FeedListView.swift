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
  @State var showDelete = false
  var feeds: [FeedEntity]
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        ForEach(feeds) { item in
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
    FeedListView(feeds: [FeedEntity(content: "예시 회고", category: .food, tags: [TagEntity(name: "고기", emoji: "🐷", category: .food), TagEntity(name: "고기", emoji: "🐷", category: .food)]),
                         FeedEntity(content: "예시 회고", category: .food, tags: [TagEntity(name: "고기", emoji: "🐷", category: .food)])])
  }
}

struct FeedContentView: View {
  let item: FeedEntity
  let deleteAction: (FeedEntity) -> ()
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(Color("pYellow"))
        .frame(height: 220)
      
      HStack(spacing: 30) {
        VStack {
          Text(item.createdDate.weekdayString())
          
          Text(item.createdDate.toDateString())
            .font(.system(size: 45, weight: .bold))
        }
        
        Rectangle()
          .fill(.primary)
          .frame(width: 1, height: 190)
        
        VStack(alignment: .leading, spacing: 5) {
          Text(item.content)
          
          HStack {
            ForEach(item.tags) { tag in
              Text(tag.emoji)
            }
          }
          .padding(.bottom, 20)
          
          Image("feedSampleImage")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
        }
        
        VStack(alignment: .trailing) {
          Spacer()
          
          if let categoryItem = Category(rawValue: item.category) {
            categoryItem.icon
              .resizable()
              .scaledToFit()
              .frame(width: 70, height: 70)
          }
          
          HStack(spacing: 0) {
            Text(item.createdDate.formattedTime12Hour())
              .font(.system(size: 15, weight: .bold))
              .frame(width: 70)
            
            Button {
              deleteAction(item)
            } label: {
              Image(systemName: "trash")
                .foregroundColor(.primary)
            }
            .background(Color("pYellow"))
          } //: HStack
        } //: VStack
        .padding([.bottom], 20)
      } //: HStack
    } //: ZStack
  } //: body
  
}
