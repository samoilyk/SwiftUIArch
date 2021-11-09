//
//  HomeObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

final class HomeObservableObject: ObservableObject {
    var globalState: GlobalState

    init(globalState: GlobalState) {
        self.globalState = globalState
    }
}
