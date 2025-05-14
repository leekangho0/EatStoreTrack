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

  @State var tagName: String
  @State var tagEmoji: String
  @State var showEmojiPicker = false

  var categories: [CategoryEntity] = [.drink, .food, .pill]
  @State var selectedCategory: CategoryEntity
  
  init(_ tag: TagEntity? = nil) {
    tagName = tag?.name ?? ""
    tagEmoji = tag?.emoji ?? "🐷"
    selectedCategory = tag?.category ?? .drink
  }
  
  let rows = Array(repeating: GridItem(.flexible()), count: 5)

  var body: some View {
    VStack {
      Picker("카테고리 선택", selection: $selectedCategory) {
        ForEach(categories) { category in
          Text("\(category.emoji) \(category.name)")
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
          .background(Color.gray.opacity(0.3))
          .clipShape(RoundedRectangle(cornerRadius: 16))
      }

      VStack {
        Text("태그 이름")
        TextField("태그 이름", text: $tagName)
          .padding(10)
          .background(
            RoundedRectangle(cornerRadius: 8)
              .fill(Color.gray.opacity(0.3))
          )
      }
      .padding(40)
      
      Button(action: addTag) {
        Text("저장하기")
          .padding()
          .frame(maxWidth: .infinity)
          .background(Color.blue)
          .foregroundColor(.white)
          .clipShape(Capsule())
          .padding(.horizontal)
      }
    }
    .padding(.horizontal, 60)
    .sheet(isPresented: $showEmojiPicker) {
      ScrollView {
        LazyVGrid(columns: rows) {
          ForEach(emoojis(selectedCategory.name), id: \.self) { tag in
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
        Text("태그 작성")
          .font(.headline)
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
    TagCreateView()
  }
}
