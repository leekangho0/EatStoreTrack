//
//  TagCreateView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI
import SwiftData

struct TagCreateView: View {
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext

  @State private var tagName: String = ""
  @State private var tagEmoji: String = "🐷"
  @State private var showEmojiPicker = false

  @State private var selectedCategory: Category = .drink
  let tag: TagEntity?
  
  private var navigationTitle: String {
    tag == nil ? "태그 작성" : "태그 수정"
  }
  
  let rows = Array(repeating: GridItem(.flexible()), count: 5)

  var body: some View {
    ZStack {
      	Color.pBack1
       		 .ignoresSafeArea()

        VStack {
          Picker("카테고리 선택", selection: $selectedCategory) {
            ForEach(Category.allCases) { category in
              Text(category.rawValue)
                .tag(category)
            }
          }
          .pickerStyle(.palette)
          .padding()

          Button {
            showEmojiPicker = true
          } label: {
            Text("\(tagEmoji)")
              .font(.system(size: 200))
              .padding()
              .background(Color.pWhiteBlack)
              .clipShape(RoundedRectangle(cornerRadius: 16))
          }
          .compositingGroup()
          .shadow(color: Color.pShadow.opacity(0.2), radius: 4, y:2)

          VStack {
            Text("태그 이름")
            TextField("키위소스듬뿍김밥", text: $tagName)
              .padding(10)
              .background(
                RoundedRectangle(cornerRadius: 8)
                  .fill(Color.pWhiteBlack.opacity(0.7))
              )
          }
          .padding(40)

          Button(action: addTag) {
            Text("저장하기")
              .padding()
              .frame(maxWidth: .infinity)
              .background(Color.pAccent2)
              .foregroundColor(.white)
              .clipShape(Capsule())
              .padding(.horizontal)
          }
        }
        .padding(.horizontal, 60)
        .onAppear(perform: {
          if let tag {
            tagName = tag.name
            tagEmoji = tag.emoji
            selectedCategory = Category(rawValue: tag.category) ?? .drink
          }
        })
        .sheet(isPresented: $showEmojiPicker) {
          ScrollView {
            LazyVGrid(columns: rows) {
              ForEach(emoojis(selectedCategory.rawValue), id: \.self) { tag in
                Button {
                  tagEmoji = tag
                  showEmojiPicker = false
                } label: {
                  Text(tag)
                    .font(.largeTitle)
                    .padding()
                }
              }
            }
            .padding()
          }
          .presentationDetents([.fraction(0.5), .fraction(0.8)])
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button("취소", role: .cancel) {
              dismiss()
            }
          }
        }
      }
  }
}

extension TagCreateView {
  func addTag() {
    let tag = TagEntity(name: tagName, emoji: tagEmoji, category: selectedCategory)
    modelContext.insert(tag)
    
    dismiss()
  }
  
  func emoojis(_ categorie: String) -> [String] {
    switch categorie {
    case "음식": return Self.foodEmojis
    case "영양제": return Self.healthEmojis
    case "음료": return Self.drinkEmojis
    default: return []
    }
  }
  
  static let foodEmojis = [
    "🍇","🍈","🍉","🍊","🍋","🍌","🍍","🥭","🍎","🍏","🍐","🍑","🍒","🍓","🫐","🥝","🍅","🫒","🥥","🥑",
    "🍆","🥔","🥕","🌽","🌶️","🫑","🥒","🥬","🥦","🧄","🧅","🍄","🥜","🌰","🍞","🥐","🥖","🫓","🥨","🥯",
    "🥞","🧇","🧀","🍖","🍗","🥩","🥓","🍔","🍟","🍕","🌭","🥪","🌮","🌯","🫔","🥙","🧆","🥚","🍳","🥘",
    "🍲","🫕","🥣","🥗","🍿","🧈","🧂","🥫","🍱","🍘","🍙","🍚","🍛","🍜","🍝","🍠","🍢","🍣","🍤","🍥",
    "🥮","🍡","🥟","🥠","🥡","🦀","🦞","🦐","🦑","🦪","🍧","🍨","🍦","🥧","🧁","🍰","🎂","🍮","🍭","🍬"
  ]

  static let drinkEmojis = [
    "🍡","🍢","🍣","🍤","🍥","🥮","🍦","🍧","🍨","🍩","🍪","🎂","🍰","🧁","🥧","🍫","🍬","🍭","🍮","🍯",
    "🍼","🥛","☕️","🍵","🧃","🥤","🧋","🍶","🍺","🍻","🥂","🍷","🥃","🍸","🍹","🧉","🧊","🥄","🍴","🍽️",
    "🥢","🫙","🍶","🍾","🍷","🍺","🍻","🥂","🥃","🧊","🥄","🍴","🍽️","🥢","🫙","🍼","🥛","🧃","🍹","🍸",
    "🧉","🧋","☕️","🍵","🧃","🥤","🧋","🍶","🍺","🍻","🥂","🍷","🥃","🍸","🍹","🧊","🥄","🍴","🍽️","🥢",
    "🫙","🧃","🥤","🧋","🍶","🍺","🍻","🥂","🍷","🥃","🍸","🍹","🧉","🧊","🥄","🍴","🍽️","🥢","🫙","🍼"
  ]

  static let healthEmojis = [
    "💊","💉","🩸","🩹","🩺","🩻","🧬","🧫","🧪","🧻","🧼","🪥","🪒","🛁","🛀","🚿","🧯","🛑","🚑","🚨",
    "⚕️","🏥","🏨","👩‍⚕️","👨‍⚕️","👨‍🔬","👩‍🔬","🧑‍🔬","🧑‍⚕️","🧑‍⚖️","⚖️","🔬","🔭","🧪","🧬","🧫","🦠","🧠","🦷",
    "🦴","🫀","🫁","🧘‍♂️","🧘‍♀️","🧘","🧎‍♂️","🧎‍♀️","🧍‍♂️","🧍‍♀️","🚶‍♂️","🚶‍♀️","🏃‍♂️","🏃‍♀️","🏋️‍♂️","🏋️‍♀️","🏌️‍♂️","🏌️‍♀️","🚴‍♂️","🚴‍♀️",
    "🚵‍♂️","🚵‍♀️","🤸‍♂️","🤸‍♀️","🤾‍♂️","🤾‍♀️","🏄‍♂️","🏄‍♀️","🏊‍♂️","🏊‍♀️","🤽‍♂️","🤽‍♀️","🚣‍♂️","🚣‍♀️","🧗‍♂️","🧗‍♀️","🏇","⛹️‍♂️","⛹️‍♀️","🤹‍♂️"
  ]
}

#Preview {
  NavigationStack {
    TagCreateView(tag: nil)
  }
}
