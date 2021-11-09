//
//  RootView.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        navigation.homeScene
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
