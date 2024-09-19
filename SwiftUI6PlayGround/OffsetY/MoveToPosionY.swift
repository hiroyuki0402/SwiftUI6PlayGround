//
//  MoveToPosionY.swift
//  SwiftUI6PlayGround
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/20.
//

import SwiftUI

/// ボタンのタップでその色までスクロールしてみる

struct MoveToPosionY: View {
    @State private var position: ScrollPosition = .init(idType: Color.self)
    private let colors: [Color] = [.red, .black, .blue, .orange, .brown, .indigo, .purple, .mint, .pink, .green]
    let cellHeight: CGFloat = 220

    var body: some View {
        NavigationStack {
            HStack {
                ForEach(colors, id: \.self) { color in
                    Button {
                        var index: CGFloat {
                            if let index = colors.firstIndex(of: color) {
                                return CGFloat(index)
                            } else {
                                return 0
                            }
                        }
                        let positionY = cellHeight * index

                        withAnimation {
                            position.scrollTo(y: positionY)
                        }
                    } label: {
                        ZStack {
                            Text("選択")
                                .font(.system(.body))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .padding(4)
                                .background(color)
                                .foregroundStyle(.white)
                                .bold()
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .frame(height: 20)
            .padding(.top)
            VStack {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10) {
                        ForEach(colors, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color)
                                .frame(height: cellHeight)
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
        .scrollPosition($position)
    }
}

#Preview {
    MoveToPosionY()
}
