//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

public extension View {

    /// Helper to create `AnyView` from view
    var anyView: AnyView {
        AnyView(self)
    }

    /// Wraps view in a full screen modal handling view
    /// - Returns: Wrapped view
    func fullScreenModalHandling() -> some View {
        modifier(FullScreenModalHandlingViewModifier())
    }
}
