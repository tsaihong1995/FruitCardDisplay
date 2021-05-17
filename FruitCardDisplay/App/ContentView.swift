//
//  ContentView.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-17.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: -PROPERTIES
    
    @State private var isShowingSetting: Bool = false
    
    var fruit: [Fruit] = fruitsData
    
    // MARK: - BODY

    var body: some View {
    
        NavigationView {
            List {
                ForEach(fruit.shuffled()) { item in
                    NavigationLink(
                        destination: FruitDetailView(fruit: item)){
                        FruitRowView(fruit: item)
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing:
                    Button(action: {
                        isShowingSetting = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                    } //: Button
                        .sheet(isPresented: $isShowingSetting, content: {
                            SettingView()
                        })
            )
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruit: fruitsData)
    }
}
