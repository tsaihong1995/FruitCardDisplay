//
//  OnboardingView.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-18.
//  Copyright © 2021 Hung-Chun. All rights reserved.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    
    var fruits: [Fruit] = fruitsData
    
    // MARK: - BODY
    var body: some View {
        TabView{
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,20)
    }
}



    // MARK: - PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group{
            OnboardingView()
            
        }
        
        
    }
}
