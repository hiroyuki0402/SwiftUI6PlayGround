//
//  ContentView.swift
//  SwiftUI6PlayGround
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/18.
//

import SwiftUI
import CoreData

/// スクロール位置の取得
struct ContentView: View {
    @State private var offsetY: CGFloat = 0

    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVStack(spacing: 10) {

                        ForEach(1...10, id: \.self) {_ in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.random())
                                .frame(height: 150)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            /// 引数のEquatable.Typeに渡したもので条件として検知することも可能
            .onScrollGeometryChange(for: CGFloat.self) { proxy in
                /* `
                 onScrollGeometryChange(for: Bool.self)でBoolの場合
                 return proxy.contentOffset.y > 100
                 にすることで100超えたところでアクションが起こせる
                 */
                return proxy.contentOffset.y
            } action: { oldValue, newValue in
                offsetY = newValue
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Offset Y\(offsetY)")
        }
    }

}
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

extension Color {
    static func random() -> Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(red: red, green: green, blue: blue)
    }
}
