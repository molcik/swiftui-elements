//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

struct FullScreenModalWrapper<Content: View>: View {
    @Environment(\.fullScreenModalState) private var modalState: FullScreenModalState
    @Environment(\.innerFullScreenModalState) private var innerModalState: FullScreenModalState
    @State private var showModal = false
    @State private var showInnerModal = false
    @State private var modalContent: AnyView? = nil
    @State private var innerModalContent: AnyView? = nil

    let content: () -> Content

    var body: some View {
        ZStack {
            content()
                .zIndex(0)
            if showModal {
                modalContent
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(1)
                    .transition(.move(edge: .bottom)).animation(.default)
            }
            if showInnerModal {
                innerModalContent
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(2)
                    .transition(.move(edge: .bottom)).animation(.default)
            }
        }
        .onReceive(modalState.displayContent) {
            if !showModal {
                showModal = true
                modalContent = $0
            }
        }
        .onReceive(modalState.close) { _ in
            DispatchQueue.main.async {
                showModal = false
                modalContent = nil
            }
            
        }
        .onReceive(innerModalState.displayContent) {
            if showInnerModal == false {
                showInnerModal = true
                innerModalContent = $0
            }
        }
        .onReceive(innerModalState.close) {
            innerModalContent = nil
            showInnerModal = false
        }
    }
}
