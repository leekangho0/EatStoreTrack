//
//  FadeOutSheetView.swift
//  EatingApp
//
//  Created by kangho lee on 5/15/25.
//

import SwiftUI

struct FadeOutSheetView<C: View>: View {
  @State private var isAppear = false
  @Environment(\.dismiss) var dismiss
  @ViewBuilder var content: () -> C
  
  var body: some View {
    Group {
      if isAppear {
        ZStack {
          Color.black.opacity(0.3)
            .ignoresSafeArea()
            .onTapGesture {
              dismiss()
            }
          VStack {
            Spacer()
            content()
          }
        }
      }
    }
    .presentationBackground(.clear)
    .transaction {
      $0.animation = .easeInOut
    }
    .transition(.opacity)
    .onAppear { isAppear = true }
  }
}
