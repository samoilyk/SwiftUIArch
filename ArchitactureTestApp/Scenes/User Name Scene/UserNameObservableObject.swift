//
//  UserNameObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

struct UserNameViewModel: Equatable {
    let userName: String
}

final class UserNameObservableObject: ObservableObject {
    @Published var sceneState: SceneState<UserNameViewModel>

    private var state: GlobalState
    private let resource: UserNameResource

    init(state: GlobalState, resource: UserNameResource) {
        self.state = state
        self.resource = resource

        state.subject
            .compactMap { $0.userName.flatMap(UserNameViewModel.init) }
            .removeDuplicates()
            .map { SceneState.hasData($0) }
            .assign(to: &$sceneState)
    }

    func userNamedChanged(to newValue: String) {
        Task {
            let result = await resource.changeUserName(to: newValue)
            switch result {
            case .success(let newName):
                state.value.userName = newName
            case .failure(let error):
                sceneState = .error(error)
            }
        }
    }
}
