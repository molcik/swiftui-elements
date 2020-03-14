//
//  ModalView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalAnchorView: View {
    
    @Binding var currentModal: Modal
    
    func isActive(modal: Modal) -> Bool {
        return [.open, .partiallyRevealed, .closed].contains(modal.position)
    }
    
    var body: some View {
        return ModifiedContent(
            content: currentModal.content,
            modifier: ModalModifier(
                position: $currentModal.position,
                offset: $currentModal.dragOffset,
                isActive: true
            )
        )
    }
}
