//
//  RootView.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigation: NavigationObservableObject

    var body: some View {
        navigation.homeScene
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
