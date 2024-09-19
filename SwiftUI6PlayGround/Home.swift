//
//  Home.swift
//  SwiftUI6PlayGround
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/20.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section("OffsetY") {
                        NavigationLink("スクロール位置の取得", destination: ContentView())
                        NavigationLink("ボタンのタップでその色までスクロール", destination: MoveToPosionY())
                        NavigationLink("半分以上を占めたら切り替わる", destination: OnScrollVisibilityChangeView())
                    }

                    Section("Effect") {
                        NavigationLink("SymbolEffect", destination: SymbolEffect())
                    }
                }
            }
        }
    }
}

#Preview {
    Home()
}
