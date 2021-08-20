//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI

struct FullScreenModalHandlingViewModifier: ViewModifier {

    public func body(content: Content) -> some View {
        FullScreenModalWrapper {
            content
        }
    }
}
