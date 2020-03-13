//
//  Modal.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

enum ModalState: CGFloat {
    
    case closed , partiallyRevealed, open, fullscreen
    case base, backgrounded, occluded
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height + 42
        case .partiallyRevealed:
            return UIScreen.main.bounds.height * 1/3
        case .open:
            return 20
        case .fullscreen, .base, .backgrounded:
            return 0
        case .occluded:
            return 30
        }
    }
}

struct Modal: Identifiable {
    let id = UUID()
    var content: AnyView
    var position: ModalState  = .base
    
    var isFullscreenEnabled: Bool = false
    var dragOffset: CGSize = .zero
}
