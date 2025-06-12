import SwiftUI

struct WalkingView: View {
    @EnvironmentObject var vm: WalkVM

    var body: some View {
        ZStack {
            Color.canvasBG.ignoresSafeArea()

            VStack {
                Spacer()

                RouteShape(coords: vm.points)
                    .stroke(Color.strokeVio, lineWidth: 4)
                    .frame(width: 200, height: 200)

                Circle()
                    .fill(Color.white.opacity(0.9))
                    .frame(width: 28, height: 28)
                    .offset(y: -12)

                Spacer()

                HStack(spacing: 24) {
                    StatText("\(vm.dist / 1000, specifier: "%.1f") km")
                    StatText("23°")                  // dato dummy
                    StatText(timeString(vm.elapsed))
                }
                .padding(.bottom, 20)

                BlurButton(title: "Stop walk") {
                    vm.stop()
                }
                .padding(.bottom, 40)
            }
        }
    }

    private func timeString(_ t: TimeInterval) -> String {
        let f = DateComponentsFormatter()
        f.allowedUnits = [.hour, .minute, .second]
        f.zeroFormattingBehavior = .pad
        return f.string(from: t) ?? "00:00"
    }
}

