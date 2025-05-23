//
//  FeedItem.swift
//  EatingApp
//
//  Created by kangho lee on 5/14/25.
//

import SwiftUI

struct FeedItem: View {
  let item: FeedEntity
  let onEdit: () -> Void
  let onDelete: () -> Void
  @State var showAlert: Bool = false
  
  var body: some View {
    VStack(alignment: .trailing) {
      HStack(spacing: 20) {
        Button(action: onEdit) {
          Image(systemName: "square.and.pencil")
        }
        
        Button{
          showAlert = true
        } label: {
          Image(systemName: "trash")
        }
        .alert("정말 게시물을 삭제하시겠습니까?", isPresented: $showAlert) {
          Button("삭제", role: .destructive) {
            onDelete()
          }
          
          Button("취소", role: .cancel) {}
        } message: {
          Text("이 작업은 되돌릴 수 없습니다.")
        } //: alert
      }
      .bold()
      .padding([.trailing, .bottom], 5)
      VStack {
        HStack {
          VStack {
            Text(item.day)
              .font(.caption)
              .padding(.top)
            
            Text(item.date)
              .font(.largeTitle)
              .bold()
            
            Text(item.time)
              .font(.caption2)
              .fontWeight(.bold)
            
            Spacer()
            
            if let category = Category(rawValue: item.category) {
              category.icon
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            }
            
            Spacer()
          }
          .foregroundStyle(.black)
          
          Rectangle()
            .foregroundStyle(.pText)
            .frame(maxWidth: 1.5, maxHeight: .infinity)
          
          VStack(alignment: .leading) {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
              ForEach(item.tags) { tag in
                Text(tag.emoji)
                  .font(.largeTitle)
                  .frame(width: 44, height: 44)
              }
            }
            .frame(maxWidth: .infinity)
            
            Text(item.content)
              .font(.headline)
              .fontWeight(.semibold)
              .foregroundStyle(.accent)
            
            Spacer()
            
            defaultImage()
              .frame(width: 200, height: 200)
              .background {
                Rectangle()
                  .foregroundStyle(.pText.opacity(0.6)) // TODO: 배경색
              }
              .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
          }
        }
      }
      .padding()
      .background(Color.pYellow)
      .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
    }
  }
}

extension FeedItem {
  @ViewBuilder
  fileprivate func defaultImage() -> some View {
    if let data = item.image, let image = UIImage(data: data) {
      Image(uiImage: image)
        .resizable()
        .scaledToFill()
    } else {
      Image(.primary)
        .resizable()
        .scaledToFit()
        .opacity(0.6)
        .padding()
    }
  }
}

extension FeedEntity {
  var day: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE"
    formatter.locale = Locale(identifier: "ko_kr")
    return formatter.string(from: createdDate)
  }
  
  var date: String {
    let calendar = Calendar.current
    let component = calendar.dateComponents([.day], from: createdDate)
    return String(component.day ?? 1)
  }
  
  var time: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm a"
    formatter.locale = Locale(identifier: "ko_kr")
    return formatter.string(from: createdDate)
  }
}

#Preview {
  FeedItem(item: .chicken, onEdit: {
    
  }, onDelete: {
    
  })
  .frame(width: 300, height: 300)
}
