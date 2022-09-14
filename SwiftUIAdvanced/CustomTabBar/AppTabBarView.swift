//
//  AppTabBarView.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 14/09/2022.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selection: String = "home"
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("home")
                }

            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("favorite")
                }

            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("profile")
                }
        }
    }
}

struct AppTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabBarView()
    }
}
