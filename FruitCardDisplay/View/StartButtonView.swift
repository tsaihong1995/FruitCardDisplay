//
//  StartButtonView.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-17.
//  Copyright © 2021 Hung-Chun. All rights reserved.
//

import SwiftUI

struct StartButtonView: View {
    
    //MARK: - PROPERTIES

    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    //MARK: - BODY
    
    var body: some View {
        
        Button(action: {
            isOnboarding = false
            print("Exit the onboarding")
        }) {
            HStack(spacing: 8){
                Text("Start")
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal,16)
            .padding(.vertical,10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
            )
            
        } //: BUTTON
        .accentColor(Color.white)
        
    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.sizeThatFits)
    }
}
