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
    
    init(isPresented: Binding<Bool>) {
        self.modalManager.newModal(isPresented: isPresented){
            Text("jasaaa")
        }
    }
    
    var body: some View {
        Text("Body")
    }
    
}
