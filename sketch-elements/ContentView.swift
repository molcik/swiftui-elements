//
//  ContentView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 12/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

// NOTE: This is needed only to change the theme, feel free to remove it
enum Theme: String, CaseIterable, Identifiable {
    case food
    case social
    case travel
    case music
    case photography
    var id: String { self.rawValue }
}

struct ContentView: View {
    
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var viewModel: MusicViewModel
    // NOTE: This is needed only to change the theme, feel free to remove it
    @State var selectedTheme = Theme.food
    // NOTE END
    
    var body: some View {
                
        return ZStack {
            

            // NOTE: This is needed only to change the theme, feel free to remove the swicth and instead of it use invoke the view directly
            // Food()
            // Social()
            switch (selectedTheme) {
                case Theme.food:
                    Food()
                case Theme.social:
                    Social()
                case Theme.travel:
                    Travel()
                case Theme.photography:
                    Photography()
                case Theme.music:
                    Music()
            
            }
            // NOTE END

            ModalAnchorView()
        }
        
        // NOTE: This is needed only to change the theme, feel free to remove it
        .actionSheet(isPresented: Binding.constant(true)) {
            
            ActionSheet(title: Text("Select a Theme"), message: Text("To invoke this menu again, you need to rerun the app. You can also set the theme directly in ContentView.swift"), buttons: [
                .default(Text("Social")) { self.selectedTheme = .social },
                .default(Text("Travel")) { self.selectedTheme = .travel },
                .default(Text("Food")) { self.selectedTheme = .food },
                .default(Text("Music")) { self.selectedTheme = .music },
                .default(Text("Photography")) {self.selectedTheme = .photography},
                .cancel()
            ])
        }
        // NOTE END

        
    }
}
