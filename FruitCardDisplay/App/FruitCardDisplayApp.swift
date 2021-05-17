//
//  FruitCardDisplayApp.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-17.
//

import SwiftUI

@main
struct FruitCardDisplayApp: App {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
