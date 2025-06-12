import SwiftUI

struct IdleView: View {
    @EnvironmentObject var vm: WalkVM

    var body: some View {
        ZStack {
            Color.canvasBG.ignoresSafeArea()
            VStack {
                Spacer()
                FaceIcon()
                    .onTapGesture {
                        vm.start()
                    }
                Spacer()
            }
        }
    }
}

