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

  let feed: FeedEntity?

  @State private var content: String = ""
  @State private var selectedImage: PhotosPickerItem?
  @State private var selectedImageData: Data?
  @State private var selectedTagIDs: Set<TagEntity> = []

  let category: Category

  init(category: Category) {
    self.category = category
    self.feed = nil
    let categoryName: String = category.rawValue
    let predicate = #Predicate<TagEntity> { tag in
      tag.category == categoryName
    }

    _filteredTags = Query(filter: predicate)
  }

  init(feed: FeedEntity) {
    self.feed = feed
    self.category = Category(rawValue: feed.category) ?? .drink
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
        .background(.pYellow)
        .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))

        Text("태그")

        TagGridLayout(tags: filteredTags, selectedTags: $selectedTagIDs)
          .background(.pYellow)
          .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))

        Text("끄적끄적")
        
        TextField(
          "",
          text: $content,
          prompt: Text("지금을 기록해주세요. (10자 이내)")
            .foregroundStyle(Color.pText.opacity(0.3))
            ,
          axis: .vertical
        )
          .padding()
          .background {
            Color.pYellow
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
        .background(Color.pYellow)
        .overlay {
          if selectedImageData != nil {
            VStack(alignment: .trailing) {
              HStack {
                Spacer()
                Button {
                  selectedImage = nil
                  selectedImageData = nil
                } label: {
                  Image(systemName: "x.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.red)
                    .background(.white)
                    .clipShape(.circle)
                    .frame(width: 30, height: 30)
                    .padding()
                }
              }

              Spacer()
            }
          }
        }
        .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))

        Button {
          saveFeed()
        } label: {
          Text("저장")
            .font(.title3)
            .bold()
            .foregroundStyle(Color.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(selectedTagIDs.isEmpty ? .pShadow.opacity(0.3) : .pAccent2)
            .clipShape(RoundedRectangle(cornerRadius: Metric.cornerRadius))
        }
        .padding(.vertical)
        .disabled(selectedTagIDs.isEmpty)
      }
      .font(.headline)
      .fontWeight(.bold)
      .foregroundStyle(Color.pText)
    }
    .scrollIndicators(.hidden)
    .navigationTitle("Feed")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem {
        Button("저장") {
          saveFeed()
        }
        .disabled(selectedTagIDs.isEmpty)
      }
    }
    .padding(30)
    .task(id: selectedImage) {
      if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
        selectedImageData = data
      }
    }
    .onAppear {
      if let feed {
        self.content = feed.content
        self.selectedImageData = feed.image
        self.selectedTagIDs = Set(feed.tags)
      }
    }
    .background(Color.pBack1)
    .ignoresSafeArea(edges: .bottom)
  }
}

extension FeedWriteView {

  func saveFeed() {
    guard !selectedTagIDs.isEmpty else { return }

    if let feed {
      feed.content = content
      feed.updatedDate = .now
      feed.image = selectedImageData
      feed.tags = Array(selectedTagIDs)
    } else {
      let newFeed = FeedEntity(
        content: self.content,
        category: self.category,
        tags: Array(selectedTagIDs),
        image: selectedImageData
      )
      modelContext.insert(newFeed)

      do {
        try modelContext.save()
      } catch {
        modelContext.rollback()
      }
    }

    dismiss()
  }
}

#Preview {
  NavigationStack {
    ModelContainerPreview(ModelContainer.samples) {
      FeedWriteView(category: .food)
    }
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
          .foregroundStyle(isSelected ? .white : .black)
//          .foregroundStyle(Color.primary)
      }
      .frame(width: 70, height: 70)
      .background(isSelected ? Color.pAccent2 : Color.white.opacity(0.25))
      .cornerRadius(10)
    }
  }
}
