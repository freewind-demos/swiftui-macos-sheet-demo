import SwiftUI

@main
struct SheetApp: App {
    var body: some Scene {
        Window("Sheet 弹出面板", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 400)
    }
}
