//
//  ModalManager.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

class ModalManager: ObservableObject {
    @Published var modal = Modal(position: .closed, content: nil)
    
    func newModal<Content: View>(position: ModalState, @ViewBuilder content: () -> Content) {
        modal = Modal(position: position, content: AnyView(content()))
    }
    
    func openModal(position: ModalState) {
        modal.position = position
    }
    
    func closeModal() {
        modal.position = .closed
    }
}
