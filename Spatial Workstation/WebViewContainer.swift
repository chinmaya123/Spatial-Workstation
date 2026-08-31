import SwiftUI
import WebKit

struct WebViewContainer: UIViewRepresentable {
    let filename: String
    var space: String = "hub"
    var onOpenWindow: ((String) -> Void)? = nil
    var onCloseWindow: (() -> Void)? = nil

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()

        // Enable JavaScript and Inline Media
        configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        configuration.allowsInlineMediaPlayback = true
        configuration.mediaTypesRequiringUserActionForPlayback = []
        configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")

        // Attach WebKit Script Message Handlers to bridge JavaScript to SwiftUI
        let contentController = WKUserContentController()
        contentController.add(context.coordinator, name: "openWindow")
        contentController.add(context.coordinator, name: "closeWindow")
        configuration.userContentController = contentController

        let webview = WKWebView(frame: .zero, configuration: configuration)
        webview.isOpaque = false
        webview.backgroundColor = UIColor.clear
        webview.scrollView.backgroundColor = UIColor.clear

        // Load index.html with query parameter for the target space
        if let filepath = Bundle.main.path(forResource: filename, ofType: "html") {
            let fileURL = URL(fileURLWithPath: filepath)
            let directoryURL = fileURL.deletingLastPathComponent()

            var components = URLComponents(url: fileURL, resolvingAgainstBaseURL: false)
            if space != "hub" {
                components?.queryItems = [URLQueryItem(name: "space", value: space)]
            }

            if let finalURL = components?.url {
                webview.loadFileURL(finalURL, allowingReadAccessTo: directoryURL)
            } else {
                webview.loadFileURL(fileURL, allowingReadAccessTo: directoryURL)
            }
        }

        return webview
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No dynamic updates required for static page loading
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate, WKScriptMessageHandler {
        var parent: WebViewContainer

        init(_ parent: WebViewContainer) {
            self.parent = parent
        }

        // Catches 'openWindow' and 'closeWindow' messages sent from JavaScript
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "openWindow", let spaceName = message.body as? String {
                DispatchQueue.main.async {
                    self.parent.onOpenWindow?(spaceName)
                }
            } else if message.name == "closeWindow" {
                DispatchQueue.main.async {
                    self.parent.onCloseWindow?()
                }
            }
        }
    }
}
