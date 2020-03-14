//
//  Modal.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

enum ModalState: CGFloat {
    
    case closed , partiallyRevealed, open
    case base, backgrounded, occluded
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height + 42
        case .partiallyRevealed:
            return UIScreen.main.bounds.height * 1/3
        case .open:
            return 20
        case .base, .backgrounded:
            return 0
        case .occluded:
            return 30
        }
    }
}

struct Modal {
    var position: ModalState  = .base
    var dragOffset: CGSize = .zero
    var content: AnyView
}
