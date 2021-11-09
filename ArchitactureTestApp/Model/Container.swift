//
//  Container.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation
import SwiftUI

final class Container {
    let networkResource: NetworkResource
    var globalState: GlobalState

    init() {
        self.globalState = GlobalState()
        self.networkResource = NetworkResource()
    }
}
