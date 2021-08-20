//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI
import Combine

/// An instance of this observable object lives on the environment
/// Any view that is wrapped with a `.fullScreenModalHandling()` view modifier will display a full-screen modal based on sending updates through its signals
public class FullScreenModalState: ObservableObject {

    /// When you want to present something modally, just send it through this signal
    public var displayContent = PassthroughSubject<AnyView, Never>()

    /// When you want to close the modal, just send an update on this signal
    public var close = PassthroughSubject<Void, Never>()
}
