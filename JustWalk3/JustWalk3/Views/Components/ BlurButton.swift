import SwiftUI

struct BlurButton: View {
    let title: String
    var action: () -> Void

    var body: some View {
        Text(title)
            .font(.custom("PatrickHand-Regular", size: 22))
            .foregroundColor(.black)
            .padding(.vertical, 14)
            .padding(.horizontal, 40)
            .background(.ultraThinMaterial, in: Capsule())
            .onTapGesture(perform: action)
    }
}

