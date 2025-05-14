//
//  FeedWriteView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct FeedWriteView: View {
  private static let placeholderText = "기록해주세요. 10자 이내"
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext
  
  @Query var filteredTags: [TagEntity]
  
  @State private var content: String = ""
  @State private var showImagePicker = false
  @State private var selectedImage: PhotosPickerItem?
  @State private var selectedImageData: Data?
  @State private var selectedTagEntitys: [TagEntity]?
  @State private var selectedTagIDs: Set<TagEntity> = []
  
  private enum Metric {
    static let cornerRadius: CGFloat = 12
  }
  
  let category: Category
  
  init(category: Category) {
    self.category = category
    let categoryName: String = category.rawValue
    let predicate = #Predicate<TagEntity> { tag in
      tag.category == categoryName
    }
    
    _filteredTags = Query(filter: predicate)
  }
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        Text("카테고리")
        HStack(spacing: 0) {
          category.icon
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
          
          Text(category.rawValue)
            .font(.headline)
            .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.pBack1)
        .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
        
        Text("태그")
        TagGridLayout(tags: filteredTags, selectedTags: $selectedTagIDs)
          .background(.pBack1)
          .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
        
        Text("회고 작성 20자")
        
        TextField("", text: $content, prompt: Text("지금을 기록해주세요. (10자 이내)"), axis: .vertical)
          .padding()
          .background {
            Color.pBack1
          }
          .onChange(of: content) { oldValue, newValue in
            content = String(content.prefix(20))
          }
          .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
        
          Text("사진")
          
          PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
            Group {
              if let selectedImageData, let image = UIImage(data: selectedImageData) {
                Image(uiImage: image)
                  .resizable()
                  .scaledToFit()
                  .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
                  .padding(20)
              } else {
                Image(systemName: "photo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 100, height: 100)
                  .tint(.primary)
              }
            }
          }
          .frame(maxWidth: .infinity, minHeight: 200)
          .background(Color.pBack1)
          .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
        
        Button {
          saveFeed()
        } label: {
          Text("저장")
            .font(.title3)
            .bold()
            .foregroundStyle(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(selectedTagIDs.isEmpty ? .secondary : Color.pYellow)
            .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
        }
        .padding(.vertical)
        .disabled(selectedTagIDs.isEmpty)
      }
    }
    .scrollIndicators(.hidden)
    .padding()
    .navigationBarBackButtonHidden(true)
    .navigationTitle("새 피드 작성")
    .task(id: selectedImage) {
      if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
        selectedImageData = data
      }
    }
  }
}

extension FeedWriteView {
  
  // data에 저장되지않는 문제 있음
  func saveFeed() {
    guard let selectedTagEntitys else { return }
    guard let selectedImageData else { return }
    
    let newFeed = FeedEntity(
      content: self.content,
      category: self.category,
      tags: selectedTagEntitys,
      image: selectedImageData,
    )
    
    modelContext.insert(newFeed)
    //
    //    do {
    //      print("saved before")
    //      try modelContext.save()
    //      print("saved after")
    //
    //      // debug
    //      let savedFeeds = try modelContext.fetch(FetchDescriptor<FeedEntity>())
    //      print("저장된 Feed 개수: \(savedFeeds.count)")
    //    } catch {
    //      print("\(error): saveFeed에서 발생한 에러")
    //    }
  }
  
}

#Preview {
  NavigationStack {
    FeedWriteView(category: .food)
      .modelContainer(try! ModelContainer.samples())
  }
}

fileprivate struct TagGridLayout: View {
  let columns = Array(repeating: GridItem(.flexible()), count: 4)
  let tags: [TagEntity]
  
  @Binding var selectedTags: Set<TagEntity>
  
  var body: some View {
    LazyVGrid(columns: columns) {
      ForEach(tags) { tag in
        let isSelected = selectedTags.contains(tag)
        SelectableTagItem(tag: tag, isSelected: isSelected) {
          if isSelected {
            selectedTags.remove(tag)
          } else {
            selectedTags.insert(tag)
          }
        }
      }
    }
    .padding()
  }
}

struct SelectableTagItem: View {
  let tag: TagEntity
  let isSelected: Bool
  let action: () -> Void
  
  var body: some View {
    Button {
      action()
    } label: {
      VStack(spacing: 2) {
        Text(tag.emoji)
          .font(.largeTitle)
        Text(tag.name)
          .font(.caption2)
          .foregroundStyle(.black)
      }
      .frame(width: 70, height: 70)
      .background(isSelected ? Color.gray.opacity(0.15) : Color.clear)
      .cornerRadius(10)
    }
  }
}
