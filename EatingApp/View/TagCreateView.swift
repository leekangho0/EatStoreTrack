//
//  TagCreateView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct TagCreateView: View {
  @Environment(\.dismiss) var dismiss

  @State var tagName: String = ""
  @State var tagEmoji: String = "🐷"
  @State var showEmojiPicker = false

  @State var selectedCategory: Int = 1

  let foodEmojis = [
    "🍇","🍈","🍉","🍊","🍋","🍌","🍍","🥭","🍎","🍏","🍐","🍑","🍒","🍓","🫐","🥝","🍅","🫒","🥥","🥑",
    "🍆","🥔","🥕","🌽","🌶️","🫑","🥒","🥬","🥦","🧄","🧅","🍄","🥜","🌰","🍞","🥐","🥖","🫓","🥨","🥯",
    "🥞","🧇","🧀","🍖","🍗","🥩","🥓","🍔","🍟","🍕","🌭","🥪","🌮","🌯","🫔","🥙","🧆","🥚","🍳","🥘",
    "🍲","🫕","🥣","🥗","🍿","🧈","🧂","🥫","🍱","🍘","🍙","🍚","🍛","🍜","🍝","🍠","🍢","🍣","🍤","🍥",
    "🥮","🍡","🥟","🥠","🥡","🦀","🦞","🦐","🦑","🦪","🍧","🍨","🍦","🥧","🧁","🍰","🎂","🍮","🍭","🍬"
  ]

  let drinkEmojis = [
    "🍡","🍢","🍣","🍤","🍥","🥮","🍦","🍧","🍨","🍩","🍪","🎂","🍰","🧁","🥧","🍫","🍬","🍭","🍮","🍯",
    "🍼","🥛","☕️","🍵","🧃","🥤","🧋","🍶","🍺","🍻","🥂","🍷","🥃","🍸","🍹","🧉","🧊","🥄","🍴","🍽️",
    "🥢","🫙","🍶","🍾","🍷","🍺","🍻","🥂","🥃","🧊","🥄","🍴","🍽️","🥢","🫙","🍼","🥛","🧃","🍹","🍸",
    "🧉","🧋","☕️","🍵","🧃","🥤","🧋","🍶","🍺","🍻","🥂","🍷","🥃","🍸","🍹","🧊","🥄","🍴","🍽️","🥢",
    "🫙","🧃","🥤","🧋","🍶","🍺","🍻","🥂","🍷","🥃","🍸","🍹","🧉","🧊","🥄","🍴","🍽️","🥢","🫙","🍼"
  ]

  let healthEmojis = [
    "💊","💉","🩸","🩹","🩺","🩻","🧬","🧫","🧪","🧻","🧼","🪥","🪒","🛁","🛀","🚿","🧯","🛑","🚑","🚨",
    "⚕️","🏥","🏨","👩‍⚕️","👨‍⚕️","👨‍🔬","👩‍🔬","🧑‍🔬","🧑‍⚕️","🧑‍⚖️","⚖️","🔬","🔭","🧪","🧬","🧫","🦠","🧠","🦷",
    "🦴","🫀","🫁","🧘‍♂️","🧘‍♀️","🧘","🧎‍♂️","🧎‍♀️","🧍‍♂️","🧍‍♀️","🚶‍♂️","🚶‍♀️","🏃‍♂️","🏃‍♀️","🏋️‍♂️","🏋️‍♀️","🏌️‍♂️","🏌️‍♀️","🚴‍♂️","🚴‍♀️",
    "🚵‍♂️","🚵‍♀️","🤸‍♂️","🤸‍♀️","🤾‍♂️","🤾‍♀️","🏄‍♂️","🏄‍♀️","🏊‍♂️","🏊‍♀️","🤽‍♂️","🤽‍♀️","🚣‍♂️","🚣‍♀️","🧗‍♂️","🧗‍♀️","🏇","⛹️‍♂️","⛹️‍♀️","🤹‍♂️"
  ]

  var body: some View {
    VStack {


      Picker("카테고리 선택", selection: $selectedCategory) {
        ForEach(sampleCategories) { category in
          Text("\(category.emoji) \( category.name)").tag(category.id)
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
      .sheet(isPresented: $showEmojiPicker) {
        ScrollView {
          // selectedCategory 값에 따라 다른 이모지 세트 선택
          let emojis: [String] = {
            switch selectedCategory {
            case 1:
              return foodEmojis
            case 2:
              return drinkEmojis
            case 3:
              return healthEmojis
            default:
              return foodEmojis + drinkEmojis + healthEmojis
            }
          }()

          LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5)) {
            ForEach(emojis, id: \.self) { emoji in
              Text(emoji)
                .font(.largeTitle)
                .padding()
                .onTapGesture {
                  tagEmoji = emoji
                  showEmojiPicker = false
                }
            }
          }
          .padding()
        }
        .presentationDetents([.fraction(0.4)])
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


      Button {

      } label: {
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

#Preview {
  NavigationStack {
    TagCreateView()
  }
}
