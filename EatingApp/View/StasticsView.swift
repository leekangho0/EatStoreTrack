//
//  StasticsView.swift
//  EatingApp
//
//  Created by drfranken on 5/12/25.
//

import SwiftUI

struct StasticsView: View {
  @Environment(\.dismiss) var dismiss

  @State var isMonthly: Bool = true
  @State var selectedCategory: Int = 0

  var body: some View {
    VStack {

      VStack(spacing: 20) {

        Text("월간/주간 랭킹")
          .font(.largeTitle)
          .foregroundStyle(Color.pText)
          .fontWeight(.heavy)

        Rectangle()
          .frame(height: 3)
          .foregroundStyle(Color.pText)

        HStack {
          Picker("월간주간 선택", selection: $isMonthly) {
            Text("월간").tag(true)
            Text("주간").tag(false)
          }
          .pickerStyle(.palette)
          .padding()


          Spacer()

          Menu {
            Button {
              selectedCategory = 0
            } label: {
              HStack {
                Image("logo")
                  .resizable()
                  .frame(width: 50, height: 50)
                Text("전체")
              }
            }

            ForEach(sampleCategories) { category in
              Button {
                selectedCategory = category.id
              } label: {
                HStack {
                  Image(category.imageName)
                    .resizable()
                    .frame(width: 50, height: 50)
                  Text(category.name)
                }
              }
            }
          } label: {
            if selectedCategory == 0 {
              Image("logo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 100, height: 100)
            } else {
              Image(sampleCategories.first(where: { $0.id == selectedCategory })?.imageName ?? "questionmark")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            }
          }

        }
        .frame(height: 50)



        ScrollView {


          // TODO: 데이터를 실시간으로 계산해서 가져올건데, 어떤 형식으로 가져올지 고민필요. 일단 이렇게 만듬
          let sampleTopRanks: [(rank: Int, emoji: String, count: Int)] = [
            (1, "🐰", 10),
            (2, "🐶", 9),
            (3, "🐱", 8),
            (4, "🦊", 7),
            (5, "🐻", 6),
            (6, "🐼", 5),
            (7, "🐨", 4),
            (8, "🐯", 3),
            (9, "🦁", 2),
            (10, "🐷", 1)
          ]

          ForEach(sampleTopRanks, id: \.rank) { rank in
            HStack {
              Text("\(rank.rank). \(rank.emoji) \(rank.count)회")
                .font(.largeTitle)

              Spacer()
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background {
              Color.yellow.opacity(0.2)
                .clipShape(Capsule())
            }
          }
        }
        .padding(20)






      }
      .frame(maxWidth: .infinity, minHeight: 500)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.pBack1)
      )
      .overlay {
        RoundedRectangle(cornerRadius: 20)
          .stroke(Color.pText, lineWidth: 3)
      }


    }
    .padding(20)
    .navigationBarBackButtonHidden(true)
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          dismiss()
        } label: {
          Image(systemName: "chevron.left")
        }
      }

      ToolbarItem(placement: .principal) {
        Text("통계")
          .font(.headline)
      }

    }
  }
}

#Preview {
  NavigationStack {
    StasticsView()
  }
}
