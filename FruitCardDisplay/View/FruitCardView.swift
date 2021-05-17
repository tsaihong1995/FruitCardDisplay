//
//  FruitCardView.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-17.
//  Copyright © 2021 Hung-Chun. All rights reserved.
//

import SwiftUI

struct FruitCardView: View {
    
    //MARK: - PROPERTIES
    
    @State var isAnimating :Bool = false
    
    var fruit: Fruit

    //MARK: - BODY
    
    var body: some View {
        ZStack {
            VStack(spacing: 20){
                // FRUIT: IMAGE
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 :0.8)
                // FRUIT: TITLE
                Text(fruit.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 2, x: 2, y: 2)
                // FRUIT:HEADLINE
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                // BUTTON: START
                StartButtonView()
                
            }
            .onAppear{
                withAnimation(.interpolatingSpring(stiffness: 150, damping: 10)) {
                    isAnimating = true
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 0, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom))
            .cornerRadius(20)
            .padding(.horizontal,20)
            .ignoresSafeArea()
            
    
        }//: VSTACK
        
    }
}

// MARK: -PREVIEW

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
