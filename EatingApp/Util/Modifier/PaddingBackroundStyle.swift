//
//  PaddingBackroundStyle.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import SwiftUI

// 중복제거용 모디파이어 따로 빼기
struct PaddedBackgroundStyle: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.horizontal, 16)
      .frame(height: 30)
      .background(Color.pWhiteBlack.opacity(0.9))
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .compositingGroup()
      .shadow(color: Color.pShadow.opacity(0.3), radius: 4, y:2)
  }
}

extension View {
  func paddedBackgroundStyle() -> some View {
    self.modifier(PaddedBackgroundStyle())
  }
}
