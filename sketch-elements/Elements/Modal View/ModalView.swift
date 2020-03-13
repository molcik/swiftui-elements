//
//  ModalView.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    @EnvironmentObject var modalManager: ModalManager
    @Binding var currentModal: Modal
    
    var isActive: Bool {
        return [.open, .partiallyRevealed, .closed, .fullscreen].contains(self.currentModal.position)
    }
    
    var body: some View {
        return ModifiedContent(content: currentModal.content, modifier: ModalModifier(isActive: isActive, position: $currentModal.position, offset: $currentModal.dragOffset, isFullscreenEnabled: currentModal.isFullscreenEnabled, modalID: currentModal.id))
    }
}
