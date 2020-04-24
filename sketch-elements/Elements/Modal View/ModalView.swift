//
//  ModalModifiers.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalView: View {
    
    // Modal State
    @Binding var modal: Modal
    @GestureState var dragState: DragState = .inactive
    
    var animation: Animation {
        Animation.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0)
            .delay(0)
    }
    
    func isActive() -> Bool {
        return [.open, .partiallyRevealed, .closed].contains(modal.position)
    }
    
    var body: some View {
        
        let drag = DragGesture()
        .updating($dragState) { drag, state, transaction in state = .dragging(translation:  drag.translation) }
        .onChanged {
            self.modal.dragOffset = $0.translation
        }
        .onEnded(onDragEnded)
    
        return ZStack(alignment: .top) {
            Color.black
                .opacity(modal.position != .closed ? 0.5 : 0)
            ZStack(alignment: .top) {
                Color("Default")
                self.modal.content
                    .frame(height: UIScreen.main.bounds.height - self.modal.position.offsetFromTop())
            }
            .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            .offset(y: isActive() ? max(20, self.modal.position.offsetFromTop() + self.dragState.translation.height) : 0)
            .animation(isActive() ? (self.dragState.isDragging ? nil : animation) : animation)
            .gesture(isActive() ? drag:nil)
        }
        .edgesIgnoringSafeArea(.vertical)
        
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        
        // Setting stops
        let higherStop: ModalState
        let lowerStop: ModalState
        
        // Nearest position for drawer to snap to.
        let nearestPosition: ModalState
        
        // Determining the direction of the drag gesture and its distance from the top
        let dragDirection = drag.predictedEndLocation.y - drag.location.y
        let offsetFromTopOfView = modal.position.offsetFromTop() + drag.translation.height
        
        // Determining whether drawer is above or below `.partiallyRevealed` threshold for snapping behavior.
        if offsetFromTopOfView <= ModalState.partiallyRevealed.offsetFromTop() {
            higherStop = .open
            lowerStop = .partiallyRevealed
        } else {
            higherStop = .partiallyRevealed
            lowerStop = .closed
        }
        
        // Determining whether drawer is closest to top or bottom
        if (offsetFromTopOfView - higherStop.offsetFromTop()) < (lowerStop.offsetFromTop() - offsetFromTopOfView) {
            nearestPosition = higherStop
        } else {
            nearestPosition = lowerStop
        }
        
        // Determining the drawer's position.
        if dragDirection > 0 {
            modal.position = lowerStop
        } else if dragDirection < 0 {
            modal.position = higherStop
        } else {
            modal.position = nearestPosition
        }
        
    }
    
}

enum DragState {
    
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}
