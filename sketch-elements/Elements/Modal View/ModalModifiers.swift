//
//  ModalModifiers.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

struct ModalModifier: ViewModifier {
    
    var isActive: Bool
    
    // Modal State
    @GestureState var dragState: DragState = .inactive
    @Binding var position: ModalState
    @Binding var offset: CGSize
    @State var isFullscreenEnabled = false
    
    var modalID: UUID
    var animation: Animation {
        Animation.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0)
            .delay(self.position == .fullscreen ? 3:0)
    }
    
    var timer: Timer? {
        return Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            if self.position == .open && self.dragState.translation.height == 0 && self.isFullscreenEnabled {
                self.position = .fullscreen
            } else {
                timer.invalidate()
            }
        }
    }
    
    func body(content: Content) -> some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, transaction in state = .dragging(translation: (self.position != .fullscreen) ? drag.translation:.zero) }
            .onChanged {
                self.offset = (self.position != .fullscreen) ? $0.translation: .zero
        }
        .onEnded(onDragEnded)
    
        return ZStack(alignment: .top) {
            Color.black
                .opacity(position != .closed ? 0.5 : 0)
            ZStack {
                content
                    .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .edgesIgnoringSafeArea(.vertical)
            .offset(y: isActive ? max(0, self.position.offsetFromTop() + self.dragState.translation.height) : 0)
            .animation(isActive ? (self.dragState.isDragging ? nil : animation) : animation)
            .gesture(isActive ? drag:nil)
        }
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        if position == .fullscreen {
            return
        }
        
        // Setting stops
        let higherStop: ModalState
        let lowerStop: ModalState
        
        // Nearest position for drawer to snap to.
        let nearestPosition: ModalState
        
        // Determining the direction of the drag gesture and its distance from the top
        let dragDirection = drag.predictedEndLocation.y - drag.location.y
        let offsetFromTopOfView = position.offsetFromTop() + drag.translation.height
        
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
            position = lowerStop
        } else if dragDirection < 0 {
            position = higherStop
        } else {
            position = nearestPosition
        }
        _ = timer
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
