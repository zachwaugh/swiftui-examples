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

    private func showBlurredWindow() {
        let window = NSWindow(contentViewController: NSHostingController(rootView: BlurredWindowView()))
        window.styleMask.insert(.fullSizeContentView)
        window.title = "Blurred Window Demo"
        window.titlebarAppearsTransparent = true
        let windowController = NSWindowController(window: window)
        windowController.showWindow(self)
        windowControllers.append(windowController)
    }
}
