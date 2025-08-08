//
//  RootView.swift
//  noisebear
//
//  Created by Christoph Huschenhöfer on 07.08.25.
//

import SwiftUI

struct RootView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashScreen()
            } else {
                ContentView()
            }
        }
        .onAppear {
            // Splashscreen für 2 Sekunden anzeigen
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSplash = false
                }
            }
        }
    }
}

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Image("noisebear")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
    }
}
