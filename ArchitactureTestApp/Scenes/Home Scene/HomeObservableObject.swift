//
//  HomeObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation
import SwiftUI

final class HomeObservableObject: BaseObservableObject {
    @Published private(set) var sceneData: HomeSceneData?

    private let resource: HomeResource

    init(state: GlobalState, resource: HomeResource) {
        self.resource = resource
        super.init(state: state)

        self.state.subject
            .map { globalState in
                guard let userName = globalState.userName,
                      let alarmName = globalState.alarmName,
                      let alarmAddrees = globalState.alarmAddress else {
                          return nil
                      }

                return HomeSceneData(userName: userName, alarmName: alarmName, alarmAddress: alarmAddrees)
            }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .assign(to: &$sceneData)

    }

    func onAppear() {
        Task {
            let result = await resource.loadData()
            switch result {
            case .success(let newData):
                var state = state.value
                state.userName = newData.userName
                state.alarmName = newData.alarmName
                state.alarmAddress = newData.alarmAddress
                self.state.value = state
            case .failure:
                // show error
                break
            }
        }
    }
}
