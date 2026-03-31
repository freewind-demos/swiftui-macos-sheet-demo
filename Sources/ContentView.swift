import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @State private var showFormSheet = false
    @State private var userName = ""
    @State private var userEmail = ""

    var body: some View {
        VStack(spacing: 30) {
            Text("Sheet 弹出面板示例")
                .font(.title)

            // 基础 Sheet
            Button("显示简单 Sheet") {
                showSheet = true
            }

            // 带表单的 Sheet
            Button("显示表单 Sheet") {
                showFormSheet = true
            }
        }
        .padding()
        // Sheet 绑定
        .sheet(isPresented: $showSheet) {
            SimpleSheetView()
        }
        .sheet(isPresented: $showFormSheet) {
            FormSheetView(userName: $userName, userEmail: $userEmail, isPresented: $showFormSheet)
        }
    }
}

// 简单的 Sheet
struct SimpleSheetView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("这是一个 Sheet")
                .font(.title)

            Text("Sheet 是从屏幕底部滑上来的面板")
                .foregroundColor(.secondary)

            Button("关闭") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(40)
        .frame(width: 400, height: 250)
    }
}

// 表单 Sheet
struct FormSheetView: View {
    @Binding var userName: String
    @Binding var userEmail: String
    @Binding var isPresented: Bool
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("用户信息表单")
                .font(.title)

            Form {
                TextField("用户名", text: $userName)
                    .textFieldStyle(.roundedBorder)

                TextField("邮箱", text: $userEmail)
                    .textFieldStyle(.roundedBorder)
            }
            .frame(height: 100)

            HStack {
                Button("取消") {
                    dismiss()
                }
                .buttonStyle(.borderless)

                Spacer()

                Button("保存") {
                    // 保存逻辑
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding(40)
        .frame(width: 400, height: 350)
    }
}
