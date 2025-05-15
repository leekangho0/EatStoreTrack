//
//  RankRow.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import SwiftUI

struct RankRow<C: Ranking>: View {
  let rank: C
  
  var body: some View {
    HStack {
      Text("\(rank.rank)위 ")
        .font(.largeTitle)
        .foregroundStyle(Color.white)
      
      Spacer()
      
      Group {
        Text("\(rank.value)")
//        Text("\(rank.name)").font(.title3)
//        Spacer().frame(width: 20)
        Text("\(rank.count)회")
      }
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
