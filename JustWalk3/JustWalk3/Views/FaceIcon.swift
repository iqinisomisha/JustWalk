import SwiftUI

struct FaceIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color.strokeVio, lineWidth: 3)
                .frame(width: 84, height: 84)

            // Глаз X
            Path { p in
                p.move(to: CGPoint(x: 28, y: 30))
                p.addLines([CGPoint(x: 38, y: 40), CGPoint(x: 28, y: 40), CGPoint(x: 38, y: 30)])
            }
            .stroke(Color.strokeVio, lineWidth: 3)

            // Глаз O
            Circle()
                .stroke(Color.strokeVio, lineWidth: 3)
                .frame(width: 12, height: 12)
                .offset(x: 14, y: -2)

            // Улыбка
            Path { p in
                p.addArc(center: CGPoint(x: 42, y: 54),
                         radius: 16,
                         startAngle: .degrees(20),
                         endAngle: .degrees(160),
                         clockwise: false)
            }
            .stroke(Color.strokeVio, lineWidth: 3)

            // Пузырёк
            Circle()
                .fill(Color.white.opacity(0.9))
                .frame(width: 28, height: 28)
                .offset(x: 28, y: 28)
        }
    }
}

