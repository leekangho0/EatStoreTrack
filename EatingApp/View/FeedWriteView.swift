//
//  FeedWriteView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct FeedWriteView: View {
  @Environment(\.dismiss) var dismiss
  @State private var content: String = ""
  @State private var showImagePicker = false
  @State private var selectedImage: UIImage?

  let selectedCategoryId: Int = 2



  var body: some View {

    ScrollView {
      VStack(spacing: 20) {
        if let selectedCategory = sampleCategories.first(where: { $0.id == selectedCategoryId }) {
          Text("\(selectedCategory.emoji) \(selectedCategory.name)")
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            .padding(.horizontal)
        }


        VStack {
          Text("태그 선택")

          let columns = Array(repeating: GridItem(.flexible()), count: 4)
          let filteredTags = sampleTags.filter { $0.category_id == selectedCategoryId }

          LazyVGrid(columns: columns, spacing: 12) {
            ForEach(filteredTags) { tag in
              VStack(spacing: 2) {
                Text(tag.emoji)
                  .font(.largeTitle)
                Text(tag.name)
                  .font(.caption2)
              }
              .frame(width: 70, height: 70)
              .background(Color.gray.opacity(0.15))
              .cornerRadius(10)
            }
          }
          .padding(.horizontal)
        }



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

#Preview {
  NavigationStack {
    FeedWriteView()
  }
}
