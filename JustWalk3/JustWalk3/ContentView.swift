import SwiftUI

struct ContentView: View {
    @StateObject private var vm = WalkVM()
    
    var body: some View {
        Group {
            switch vm.state {
            case .idle:
                IdleView()
            case .walking:
                WalkingView()
            case .library:
                LibraryView()
            }
        }
        .environmentObject(vm)
        .background(Color.canvasBG.ignoresSafeArea())
    }
}

