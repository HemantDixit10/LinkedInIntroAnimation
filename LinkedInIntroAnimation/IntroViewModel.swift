//
//  IntroViewModel.swift
//  LinkedInIntroAnimation
//
//  Created by Tristate on 25.08.23.
//

import Foundation

class IntroViewModel: ObservableObject {
    // MARK: - Published Variables Defined
    @Published var currentPage: Int = 0
    @Published var isAnimatingRightToLeft: Bool = false
    ///  images with these names are placed  in my assets
    let arrIntro: [IntroModel] = [IntroModel(title: "Sample text for Page 1", icon: "welcome-one"),
                                  IntroModel(title: "Sample text for Page 2", icon: "welcome-two"),
                                  IntroModel(title: "Sample text for Page 3", icon: "welcome-three"),
                                  IntroModel(title: "Sample text for Page 4", icon: "welcome-four")]
}

struct IntroModel {
    let title: String
    let icon: String
}
