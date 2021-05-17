//
//  FruitNutrientsView.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-18.
//  Copyright © 2021 Hung-Chun. All rights reserved.
//

import SwiftUI

struct FruitNutrientsView: View {
  // MARK: - PROPERTIES
  
  var fruit: Fruit
  let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]

  // MARK: - BODY

  var body: some View {
    GroupBox() {
      DisclosureGroup("Nutritional value per 100g") {
        ForEach(0..<nutrients.count) { item in
          Divider().padding(.vertical, 2)
          
          HStack {
            Group {
              Image(systemName: "info.circle")
              Text(nutrients[item])
            }
            .foregroundColor(fruit.gradientColors[1])
            .font(Font.system(.body).bold())
            
            Spacer(minLength: 25)
            
            Text(fruit.nutrition[item])
              .multilineTextAlignment(.trailing)
          }
        }
      }
    } //: BOX
  }
}

// MARK: - PREVIEW

struct FruitNutrientsView_Previews: PreviewProvider {
  static var previews: some View {
    FruitNutrientsView(fruit: fruitsData[0])
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 375, height: 480))
      .padding()
  }
}
