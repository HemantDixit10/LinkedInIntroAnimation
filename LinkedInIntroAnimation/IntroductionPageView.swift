//
//  IntroductionPageView.swift
//  LinkedInIntroAnimation
//
//  Created by Tristate2018 on 04/08/23.
//

import SwiftUI

// MARK: - Introduction Page View
struct IntroductionPageView: View {
    // MARK: - Variable Declaration
    @State private var animating = false
    @State var introData: IntroModel
    let currentPage: Int
    let index: Int
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // MARK: - Image
                Image(introData.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width + 80)
//                    .opacity(animating ? 1 : 0) // Fade-in animation for the image
                    .offset(x: animating ? 0 : -80 + leadingOffset(geometry))
                    .opacity(animatingOpacity(geometry))
                    .animation(.easeInOut(duration: 10).repeatForever(), value: self.animating)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2)) {
                            self.animating.toggle()
                        }
                    }
                // MARK: - Text
                Text(introData.title)
                    .foregroundColor(.white)
                    .font(Font.title2)
                    .fontWeight(.semibold)
                    .padding(4)
                    .cornerRadius(4)
                    .shadow(color: .black, radius: 3, x: 1, y: 1)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            .background(Color.black)
            .opacity(currentPage == index ? 1 : 0)
            .animation(.easeInOut(duration: 4), value: currentPage)
        }
    }
    // Calculate the opacity for the animation based on the current page
    private func animatingOpacity(_ geometry: GeometryProxy) -> Double {
        return currentPage == index ? 1 : 0.5
    }
    // Calculate the leading offset based on the device size
    private func leadingOffset(_ geometry: GeometryProxy) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let offset: CGFloat = (screenWidth - geometry.size.width) / 2
        return offset
    }
}
