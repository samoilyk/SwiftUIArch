//
//  ArchitactureTestAppApp.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

@main
struct ArchitactureTestAppApp: App {
    @StateObject var navigation: NavigationObservableObject = NavigationObservableObject(container: Container())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navigation)
        }
    }
}
