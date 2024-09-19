//
//  OnScrollVisibilityChangeView.swift
//  SwiftUI6PlayGround
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/20.
//

import SwiftUI

/// 半分以上を占めたら切り替わる

struct OnScrollVisibilityChangeView: View {
    @State private var offsetY: CGFloat = 0
    @State private var title: String = ""
    @State private var choiceColor: Color = .red
    private let colors: [Color] = [.red, .black, .blue, .orange, .brown]

    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(choiceColor)
                        .frame(width: 200, height: 50)

                    Text("選択しているコンテンツの色: \n\(title)")
                        .font(.caption2)
                        .bold()
                        .foregroundStyle(.white)
                        .opacity(0.9)
                }
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color)
                                .containerRelativeFrame(.horizontal)
                                .onScrollVisibilityChange(threshold: 0.5) { status in
                                    if status {
                                        title = "\(color)"
                                        choiceColor = color
                                    }
                                }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    OnScrollVisibilityChangeView()
}
