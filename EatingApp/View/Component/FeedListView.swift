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
  
  @Query(sort: \FeedEntity.createdDate, order: .reverse)
  var items: [FeedEntity]
  @State var showDelete = false
  @State private var selectedFeed: FeedEntity?
  
  init(selectedDate: Date) {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: selectedDate)
    let startOfMonth = calendar.date(from: components) ?? .now
    let endOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1),to: startOfMonth) ?? .now
    
    let predicate = #Predicate<FeedEntity> { feed in
      feed.createdDate >= startOfMonth && feed.createdDate <= endOfMonth
    }
    let sort = [SortDescriptor(\FeedEntity.createdDate, order: .reverse)]
    
    _items = Query(filter: predicate, sort: sort, animation: .bouncy)
  }
  
  var body: some View {
    Group {
      if items.isEmpty {
        ContentUnavailableView("오늘 하루 먹은 걸 기록해보세요!", systemImage: "spoon.serving", description: Text("식사, 간식, 음료 모두"))
      } else {
        ScrollView {
          VStack(alignment: .leading, spacing: 20) {
            ForEach(items) { item in
              FeedItem(item: item) {
                selectedFeed = item
              } onDelete: {
                withAnimation {
                  modelContext.delete(item)
                }
              }
            }
          } //: VStack
          .padding(.horizontal, 20)
        }
        .navigationDestination(item: $selectedFeed) { item in
          FeedWriteView(feed: item)
        }
        //: ScrollView
      } //: body
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
    FeedListView(selectedDate: .now)
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
