//
//  SceneState.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

enum SceneState<T> {
    case hasData(T)
    case error(Error)
    case loading(Bool)
}
