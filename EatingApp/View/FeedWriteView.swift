//
//  FeedWriteView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct FeedWriteView: View {
  
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) private var modelContext
  @State private var content: String = ""
  @State private var showImagePicker = false
  @State private var selectedImage: UIImage?
  @State private var selectedTagEntitys: [TagEntity]?
  @State private var selectedTagIDs: Set<PersistentIdentifier> = [] // 선택된 tag를 관리하는 set
  
  let selectedCategoryEntity: CategoryEntity

  init(selectedCategoryEntity: CategoryEntity) {
    self.selectedCategoryEntity = selectedCategoryEntity
  }

  var body: some View {

    ScrollView {
      VStack(spacing: 20) {
        
          Text("\(selectedCategoryEntity.emoji) \(selectedCategoryEntity.name)")
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)


        VStack {
          Text("태그 선택")

          let columns = Array(repeating: GridItem(.flexible()), count: 4)

          LazyVGrid(columns: columns, spacing: 12) {
            ForEach(selectedCategoryEntity.tags) { tag in
              let isSelected = selectedTagIDs.contains(tag.persistentModelID)
              
              VStack(spacing: 2) {
                Text(tag.emoji)
                  .font(.largeTitle)
                Text(tag.name)
                  .font(.caption2)
              }
              .frame(width: 70, height: 70)
              .background(isSelected ? Color.gray.opacity(0.15) : Color.clear)
              // isSelected 값에 따라서 배경색을 정하는 코드입니다.
              .cornerRadius(10)
              .onTapGesture {
                if isSelected {
                  selectedTagIDs.remove(tag.persistentModelID)
                  
                } else {
                  selectedTagIDs.insert(tag.persistentModelID)
                }
                
                // selectedTagIDs에 포함된 ID들에 해당하는 TagEntity 객체들만 추려내서,
                // selectedTagEntitys: [TagEntity]에 저장합니다.
                selectedTagEntitys = selectedCategoryEntity.tags.filter {
                  selectedTagIDs.contains($0.persistentModelID)
                }
              }
            }
          } //: LazyVGrid
          .padding(.horizontal)
        } //: VStack



        Text("회고 작성")
        ZStack(alignment: .topLeading) {
          if content.isEmpty {
            Text("내용을 입력하세요")
              .foregroundColor(.gray)
              .padding(.horizontal, 8)
              .padding(.vertical, 12)
            // TODO: 왜 안됨?
          }
          TextEditor(text: $content)
            .padding(4)
            .background(Color.clear)
        }
        .frame(height: 200)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(Color.gray.opacity(0.5))
        )
        .padding(.horizontal)

        Spacer()



        VStack {
          Text("사진")

          Button {
            showImagePicker = true
          } label: {
            ZStack {
              if let image = selectedImage {
                Image(uiImage: image)
                  .resizable()
                  .scaledToFill()
                  .frame(height: 180)
                  .clipped()
                  .clipShape(RoundedRectangle(cornerRadius: 10))
              } else {
                Color.blue.opacity(0.2)
                  .frame(height: 180)
                  .clipShape(RoundedRectangle(cornerRadius: 10))

                Image(systemName: "photo")
              }
            }
          }

        }

        Button(action: {
          // TODO: 저장 액션
          dismiss()
        }) {
          Text("저장하기")
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)
        }

      }
      .padding()
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            self.saveFeed()
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
          }
        }

        ToolbarItem(placement: .principal) {
          Text("새 피드 작성")
            .font(.headline)
        }
      }
    }
    .sheet(isPresented: $showImagePicker) {
      ImagePicker(image: $selectedImage)
    }
  }
}

extension FeedWriteView {
  
  func saveFeed() {
    guard let selectedTagEntitys = selectedTagEntitys else { return }
    guard let selectedImage = selectedImage, let imageData = selectedImage.jpegData(compressionQuality: 0.8) else { return }
    // selectedImage 이미지 압축
    
    let newFeed = FeedEntity(
      content: self.content,
      category: self.selectedCategoryEntity,
      tags: selectedTagEntitys,
      image: imageData
    )
    
    modelContext.insert(newFeed)
    
    do {
      try modelContext.save()
      
      let savedFeeds = try modelContext.fetch(FetchDescriptor<FeedEntity>())
      print("저장된 Feed 개수: \(savedFeeds.count)")
    } catch {
      print("\(error): saveFeed에서 발생한 에러")
    }
  }
  
}

#Preview {
  NavigationStack {
//    FeedWriteView()
  }
}
