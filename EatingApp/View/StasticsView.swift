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
    ZStack {
      Color.pBack1
        .ignoresSafeArea()

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
              Text("\(rank.rank)위 ")
                .font(.largeTitle)
                .foregroundStyle(Color.white)

              Spacer()
              
              Text("\(rank.emoji) \(rank.count)회")
                .font(.title)
                .foregroundStyle(Color.pBack1)


            }
            .padding(10)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background {
              RoundedRectangle(cornerRadius: 18)
                .fill(Color.pAccent2.opacity(0.9))
                .compositingGroup()
                .shadow(color: Color.pShadow.opacity(0.2), radius: 2, y:1)
            }
          }
        }
        .padding(10)






      }
      .padding()
      .frame(maxWidth: .infinity, minHeight: 500)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.pWhiteBlack)
      )
      .compositingGroup()
      .shadow(color: Color.pShadow.opacity(0.2), radius: 4, y:2)

    }
    .padding(20)
    .navigationTitle("통계")
    .navigationBarTitleDisplayMode(.large)
    }
  }
}

#Preview {
  NavigationStack {
    StasticsView()
  }
}
