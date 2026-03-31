# SwiftUI macOS Sheet 弹出面板

## 简介

演示 SwiftUI 中 Sheet 的用法，用于从底部滑出的表单/对话框。

## 快速开始

```bash
cd swiftui-macos-sheet-demo
xcodegen generate
open SwiftUISheetDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 Sheet

```swift
@State private var showSheet = false

Button("显示") {
    showSheet = true
}

.sheet(isPresented: $showSheet) {
    SheetContentView()
}
```

### 关闭 Sheet

```swift
struct SheetContent: View {
    @Environment(\.dismiss) private var dismiss

    Button("关闭") {
        dismiss()
    }
}
```

### 传递数据

通过 Binding 在 Sheet 和父视图间传递数据：

```swift
.sheet(isPresented: $showFormSheet) {
    FormSheetView(userName: $userName, userEmail: $userEmail)
}
```

## 完整示例

```swift
struct ContentView: View {
    @State private var showSheet = false

    var body: some View {
        Button("打开表单") {
            showSheet = true
        }
        .sheet(isPresented: $showSheet) {
            MyFormSheet()
        }
    }
}
```

## 完整讲解（中文）

### Sheet vs Alert

| 组件 | 用途 | 特点 |
|------|------|------|
| Sheet | 表单/编辑 | 可包含复杂 UI |
| Alert | 提示信息 | 简单消息/确认 |

### 使用场景

- 编辑用户资料
- 添加新项目表单
- 设置/配置界面
- 确认对话框
