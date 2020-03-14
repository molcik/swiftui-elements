//
//  ModalView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 14/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var modalManager: ModalManager
    @State var presented: Bool = true
    
    var body: some View {
        ButtonPrimary(
            title: "See Ingredients",
            action: {
                self.modalManager.newModal(isPresented: self.$presented){
                    Text("jasaaa")
                }
                
        }
        )
    }
    
}
