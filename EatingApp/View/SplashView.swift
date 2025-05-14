//
//  SplashView.swift
//  firstPage
//
//  Created by myday on 5/14/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack(spacing: 1) {
            Spacer()

            Image("textLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 240)

            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pBack1)
        .ignoresSafeArea()
        .onAppear {
          // 1.5초 후 전환
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {

          }
        }
    }
}

#Preview {
    SplashView()
}
