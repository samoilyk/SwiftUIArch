//
//  BaseObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

class BaseObservableObject: ObservableObject {
    @Published private(set) var loadingState: LoadingState = .success

    private(set) var state: GlobalState

    init(state: GlobalState) {
        self.state = state
    }

    func changeLoadingState(to newValue: LoadingState) {
        DispatchQueue.main.async {
            self.loadingState = newValue
        }
    }
}
