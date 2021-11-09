//
//  ArchitactureTestAppApp.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

@main
struct ArchitactureTestAppApp: App {
    @StateObject var navigation: Navigation = Navigation(container: Container())

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(navigation)
        }
    }
}
