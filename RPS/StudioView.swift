//
//  StudioView.swift
//  RPS
//
//  Created by Ray Huang on 2024/11/28.
//

import SwiftUI

struct StudioView: View {
    @State private var showLoginView = false
    @State private var imageOpacity = 0.0
    
    var body: some View {
        NavigationStack {
            if showLoginView {
                LoginView()
            } else {
                Image("StudioPicture")
                    .resizable()
                    .scaledToFit()
                    .opacity(imageOpacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5)) {
                            imageOpacity = 1.0
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                imageOpacity = 0.0
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            showLoginView = true
                        }
                    }
            }
        }
    }
}

#Preview {
    StudioView()
}

