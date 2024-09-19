//
//  SymbolEffect.swift
//  SwiftUI6PlayGround
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/20.
//

import SwiftUI

/// アイコンのエフェクト

struct SymbolEffect: View {
    @State var trigger: Bool = false

    var body: some View {
        VStack {
            ForEach(1...5, id: \.self) { index in
                switch index {
                case 1:
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 50))
                        .symbolEffect(.bounce, value: trigger)
                        .onTapGesture {
                            trigger.toggle()
                        }

                case 2:
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 50))
                        .symbolEffect(.breathe, value: trigger)
                        .onTapGesture {
                            trigger.toggle()
                        }
                case 3:
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 50))
                        .symbolEffect(.pulse, value: trigger)
                        .onTapGesture {
                            trigger.toggle()
                        }
                case 4:
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 50))
                        .symbolEffect(.wiggle, value: trigger)
                        .onTapGesture {
                            trigger.toggle()
                        }
                case 5:
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 50))
                        .symbolEffect(.rotate, value: trigger)
                        .onTapGesture {
                            trigger.toggle()
                        }
                default:
                    Image(systemName: "chevron.backward")
                        .font(.system(size: 50))
                        .symbolEffect(.breathe, value: trigger)
                        .onTapGesture {
                            trigger.toggle()
                        }
                }


            }

        }
    }
}

#Preview {
    SymbolEffect()
}
