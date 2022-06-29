import SwiftUI

/// To get the blurred window look, we need to use `NSVisualEffectView`
/// which isn't yet available directly in SwiftUI, so we wrap it in a
/// `NSViewRepresentable` and set that as the background for the main content
/// of the window. You need to add `ignoresSafeArea()` if you want it to sit under
/// the toolbar
struct BlurredWindowContentView: View {
    var body: some View {
        content
            .background(VisualEffectView().ignoresSafeArea())
    }

    /// Doesn't matter what the content is, this is just for the demo
    private var content: some View {
        Text("This is a SwiftUI view on macOS with a blurred window background")
            .multilineTextAlignment(.center)
            .foregroundColor(.secondary)
            .padding()
            .frame(minWidth: 400, maxWidth: .infinity, minHeight: 400, maxHeight: .infinity)
    }
}

struct BlurredWindowContentViewView_Previews: PreviewProvider {
    static var previews: some View {
        BlurredWindowContentView()
    }
}
