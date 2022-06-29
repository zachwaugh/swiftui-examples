import SwiftUI

struct BlurredWindowView: View {
    var body: some View {
        Text("This is a SwiftUI view on macOS with a blurred window background")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .padding()
            .frame(minWidth: 400, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
            .background(VisualEffectView().ignoresSafeArea())
    }
}

struct BlurredWindowView_Previews: PreviewProvider {
    static var previews: some View {
        BlurredWindowView()
            .previewLayout(.sizeThatFits)
    }
}
