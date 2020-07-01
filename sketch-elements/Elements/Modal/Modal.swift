//
//  Modal.swift
//  sketch-elements
//
//  Created by Filip Molcik on 11/03/2020.
//  Copyright © 2020 Filip Molcik. All rights reserved.
//

import SwiftUI

enum ModalState: CGFloat {
    
    case closed ,partiallyRevealed, open
    
    func offsetFromTop() -> CGFloat {
        switch self {
        case .closed:
            return UIScreen.main.bounds.height
        case .partiallyRevealed:
            return UIScreen.main.bounds.height * 1/4
        case .open:
            return 0
        }
    }
}

struct Modal {
    var position: ModalState  = .closed
    var dragOffset: CGSize = .zero
    var content: AnyView?
}
