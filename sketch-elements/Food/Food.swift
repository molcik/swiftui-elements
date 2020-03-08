//
//  ContentView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 26/02/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct FoodView: View {
    
    var categories:[Category] = recipeCategoriesData
    
    var body: some View {
        TabView() {
            RecipesView(categories: categories).tabItem {
                Text("Recipes")
                Image(systemName: "doc")
            }
            Text("Tab Content 2").tabItem {
                Text("Restaurants")
                Image(systemName: "person.crop.circle")
            }
        }
        .tabBarOpaque()
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color("BrandPrimary"))
    }
}

struct NavigationBarModifier: ViewModifier {
        
    init( backgroundColor: UIColor?) {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = backgroundColor ?? .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    func body(content: Content) -> some View {
        content
    }
}

struct TabBarModifier: ViewModifier {
    init() {
        let opaqueAppearance = UITabBarAppearance()
        opaqueAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = opaqueAppearance
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    
    func tabBarOpaque() -> some View {
        self.modifier(TabBarModifier())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView().environmentObject(UserData())
    }
}
