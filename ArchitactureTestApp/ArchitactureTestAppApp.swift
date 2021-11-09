//
//  ArchitactureTestAppApp.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

@main
struct ArchitactureTestAppApp: App {

    var body: some Scene {
        WindowGroup {
            HomeScene(homeObservableObject: HomeObservableObject(globalState: GlobalState()))
        }
    }
}
