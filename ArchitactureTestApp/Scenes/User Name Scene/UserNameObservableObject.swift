//
//  UserNameObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

final class UserNameObservableObject: BaseObservableObject {
    @Published private(set) var componentData: UserNameData?

    private let resource: UserNameResource

    init(state: GlobalState, resource: UserNameResource) {
        self.resource = resource
        super.init(state: state)

        self.state.subject
            .map { $0.userName.flatMap(UserNameData.init) }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .assign(to: &$componentData)
    }

    func userNamedChanged(to newValue: String) {
        Task {
            changeLoadingState(to: .isLoading)
            let result = await resource.changeUserName(to: newValue)
            switch result {
            case .success(let newName):
                state.value.userName = newName
                changeLoadingState(to: .success)
            case .failure(let error):
                changeLoadingState(to: .error(error))
            }
        }
    }
}
