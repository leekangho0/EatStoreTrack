//
//  FirstView.swift
//  EatingApp
//
//  Created by drfranken on 5/14/25.
//

import SwiftUI

struct FirstView: View {
  @State private var showSplash = true
  var body: some View {
    if showSplash {
      SplashView()
        .onAppear {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
              showSplash = false
            }
          }
        }
    } else {
      HomeView()
    }
  }
}

#Preview {
  FirstView()
}
