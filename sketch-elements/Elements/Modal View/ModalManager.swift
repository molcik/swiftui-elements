//
//  ModalManager.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

class ModalManager: ObservableObject {
    
    @Published var modal: Modal = Modal(content: AnyView(
            ZStack {
                Color("Default")
            }
         ), position: .partiallyRevealed)
    
    
    func setModal(content: AnyView) {
        modal = Modal(content: AnyView(
               content
        ), position: .partiallyRevealed)
    }
    
    func revealModal() {
        modal.position = .partiallyRevealed
    }
    
    func closeModal() {
        modal.position = .closed
    }
    
}
