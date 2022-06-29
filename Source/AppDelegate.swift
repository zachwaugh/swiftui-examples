import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    private var windowControllers: [NSWindowController] = []

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        showBlurredWindow()
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            windowControllers.forEach { $0.showWindow(self) }
            return false
        } else {
            return true
        }
    }

    /// Show a window controller demonstrating the blurred window effect in a SwiftUI view
    private func showBlurredWindow() {
        let window = NSWindow(contentViewController: NSHostingController(rootView: BlurredWindowContentView()))
        window.title = "Blurred Window Demo"

        // The styleMask and transparent titlebar aren't required, but look better to me
        window.styleMask.insert(.fullSizeContentView)
        window.titlebarAppearsTransparent = true

        let windowController = NSWindowController(window: window)
        windowController.showWindow(self)
        windowControllers.append(windowController)
    }
}
