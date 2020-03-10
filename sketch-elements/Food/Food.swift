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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FoodView().environmentObject(UserData())
    }
}


/* EXTENSION */

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    
    func tabBarOpaque() -> some View {
        self.modifier(TabBarModifier())
    }
}

struct NavigationBarModifier: ViewModifier {
        
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white

    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
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
