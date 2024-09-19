//
//  SwiftUI6PlayGroundApp.swift
//  SwiftUI6PlayGround
//
//  Created by SHIRAISHI HIROYUKI on 2024/09/18.
//

import SwiftUI

@main
struct SwiftUI6PlayGroundApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
