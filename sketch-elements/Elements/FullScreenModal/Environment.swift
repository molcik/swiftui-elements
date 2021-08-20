//
//  Copyright © 2020 Tamas Dancsi. All rights reserved.
//

import SwiftUI


struct FullScreenModalStateEnvironmentKey: EnvironmentKey {
    static var defaultValue = FullScreenModalState()
}

struct InnerFullScreenModalStateEnvironmentKey: EnvironmentKey {
    static var defaultValue = FullScreenModalState()
}

public extension EnvironmentValues {
    var fullScreenModalState: FullScreenModalState {
        get {
            self[FullScreenModalStateEnvironmentKey.self]
        }
        set {
            self[FullScreenModalStateEnvironmentKey.self] = newValue
        }
    }

    var innerFullScreenModalState: FullScreenModalState {
        get {
            self[InnerFullScreenModalStateEnvironmentKey.self]
        }
        set {
            self[InnerFullScreenModalStateEnvironmentKey.self] = newValue
        }
    }
}
