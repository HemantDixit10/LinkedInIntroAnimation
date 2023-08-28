//
//  LinkedInIntroAnimationApp.swift
//  LinkedInIntroAnimation
//
//  Created by Tristate2018 on 03/08/23.
//

import SwiftUI

@main
// MARK: - LinkedIn Intro Animation App
struct LinkedInIntroAnimationApp: App {
    var body: some Scene {
        WindowGroup {
            IntroScreenView(viewModel: IntroViewModel())
        }
    }
}
