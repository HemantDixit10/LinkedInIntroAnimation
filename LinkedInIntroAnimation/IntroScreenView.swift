//
//  IntroScreenView.swift
//  LinkedInIntroAnimation
//
//  Created by Tristate on 03/08/23.
//

import SwiftUI

// MARK: - Main Intro Screen View
struct IntroScreenView: View {
    // MARK: - Variable Declaration
    @ObservedObject var viewModel: IntroViewModel

    var body: some View {
        TabView(selection: $viewModel.currentPage) {
            ForEach(0..<viewModel.arrIntro.count, id: \.self) { index in
                IntroductionPageView(
                    introData: viewModel.arrIntro[index], currentPage: viewModel.currentPage, index: index)
                .ignoresSafeArea()
                .tag(index)
                .opacity(viewModel.isAnimatingRightToLeft && index == viewModel.currentPage ? 0 : 1)
                .onChange(of: viewModel.currentPage) { newPage in
                    withAnimation {
                        viewModel.isAnimatingRightToLeft = newPage < index
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onChange(of: viewModel.currentPage) { newPage in
            withAnimation {
                viewModel.currentPage = newPage
            }
        }
        .ignoresSafeArea()
    }
}

// MARK: - Intro Screen View Preview
struct IntroScreenView_Previews: PreviewProvider {
    static var previews: some View {
        IntroScreenView(viewModel: IntroViewModel())
    }
}
