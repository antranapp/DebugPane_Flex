//
// Copyright © 2021 An Tran. All rights reserved.
//

import Combine
import FLEX
import Foundation
import SwiftUI
import TweakPane

public struct FlexBlade: Blade {
    public var name: String? = "Flex"
    
    public init() {}
    
    public func render() -> AnyView {
        AnyView(ContentView())
    }
}

private struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        InputBlade(name: "Toggle Flex", binding: InputBinding($viewModel.isShowingFlex)).render()
    }
}

extension ContentView {
    final class ViewModel: ObservableObject {
        @Published var isShowingFlex: Bool = false
        
        private var cancellable: AnyCancellable?
        
        init() {
            cancellable = $isShowingFlex.sink { value in
                if value {
                    FLEXManager.shared.showExplorer()
                } else {
                    FLEXManager.shared.hideExplorer()
                }
            }
        }
    }
}
