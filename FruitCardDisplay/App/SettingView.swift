//
//  SettingView.swift
//  FruitCardDisplay
//
//  Created by Hung-Chun Tsai on 2021-01-18.
//  Copyright © 2021 Hung-Chun. All rights reserved.
//

import SwiftUI

struct SettingView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  
  // MARK: - BODY

  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 20) {
          // MARK: - SECTION 1
          
          GroupBox(
            label:
              SettingLabelView(labelText: "Fructus", labelImage: "info.circle")
          ) {
            Divider().padding(.vertical, 4)
            
            HStack(alignment: .center, spacing: 10) {
              Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(9)
              
              Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                .font(.footnote)
            }
          }
          
          // MARK: - SECTION 2
          
          GroupBox(
            label: SettingLabelView(labelText: "Customization", labelImage: "paintbrush")
          ) {
            Divider().padding(.vertical, 4)
            
            Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
              .padding(.vertical, 8)
              .frame(minHeight: 60)
              .layoutPriority(1)
              .font(.footnote)
              .multilineTextAlignment(.leading)
            
            Toggle(isOn: $isOnboarding) {
              if isOnboarding {
                Text("Restarted".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.green)
              } else {
                Text("Restart".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(Color.secondary)
              }
            }
            .padding()
            .background(
              Color(UIColor.tertiarySystemBackground)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            )
          }
          
          // MARK: - SECTION 3
          
          GroupBox(
            label:
            SettingLabelView(labelText: "Application", labelImage: "apps.iphone")
          ) {
            SettingsRowView(name: "Developer", content: "Hung-Chun, Tsai")
            SettingsRowView(name: "Compatibility", content: "iOS 14")
            SettingsRowView(name: "Previous Works", linkLabel: "Youtube", linkDestination: "youtube.com/playlist?list=PL4scIpuYXRRdHRXPCOhnTATJoIKgy7M9b")
            SettingsRowView(name: "LinkedIn", linkLabel: "@Hung-Chun", linkDestination: "www.linkedin.com/in/hungchun-tsai-372584175/")
            SettingsRowView(name: "SwiftUI", content: "2.0")
            SettingsRowView(name: "Version", content: "1.1.0")
          }
          
        } //: VSTACK
        .navigationBarTitle(Text("Settings"), displayMode: .large)
        .navigationBarItems(
          trailing:
            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "xmark")
            }
        )
        .padding()
      } //: SCROLL
    } //: NAVIGATION
  }
}


 // MARK: - SettingsRowView
struct SettingsRowView: View {
  // MARK: - PROPERTIES
  
  var name: String
  var content: String? = nil
  var linkLabel: String? = nil
  var linkDestination: String? = nil

  // MARK: - BODY

  var body: some View {
    VStack {
      Divider().padding(.vertical, 4)
      
      HStack {
        Text(name).foregroundColor(Color.gray)
        Spacer()
        if (content != nil) {
          Text(content!)
        } else if (linkLabel != nil && linkDestination != nil) {
          Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
          Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
        }
        else {
          EmptyView()
        }
      }
    }
  }
}



struct SettingLabelView: View {
  // MARK: - PROPERTIES
  
  var labelText: String
  var labelImage: String

  // MARK: - BODY

  var body: some View {
    HStack {
      Text(labelText.uppercased()).fontWeight(.bold)
      Spacer()
      Image(systemName: labelImage)
    }
  }
}

// MARK: - PREVIEW

struct SettingView_Previews: PreviewProvider {
  static var previews: some View {
    SettingView()
      .preferredColorScheme(.dark)
      .previewDevice("iPhone 11 Pro")
  }
}
