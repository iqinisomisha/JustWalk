import SwiftUI

struct LibraryView: View {
    @EnvironmentObject var vm: WalkVM
    let cols = Array(repeating: GridItem(.flexible(), spacing: 16), count: 4)

    var body: some View {
        ZStack {
            Color.canvasBG.ignoresSafeArea()

            VStack(alignment: .leading, spacing: 16) {
                Text("all walks")
                    .font(.custom("PatrickHand-Regular", size: 28))
                    .padding(.leading, 24)

                ScrollView {
                    LazyVGrid(columns: cols, spacing: 24) {
                        ForEach(vm.walks.indices, id: \.self) { i in
                            RouteShape(coords: vm.walks[i])
                                .stroke(Color.strokeVio, lineWidth: 2)
                                .frame(width: 64, height: 64)
                        }
                    }
                    .padding(.horizontal)
                }

                Spacer()

                BlurButton(title: "Start walking") {
                    vm.state = .idle
                }
                .padding(.bottom, 40)
            }
        }
    }
}

