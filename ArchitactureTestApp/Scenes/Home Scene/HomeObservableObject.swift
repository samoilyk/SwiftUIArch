//
//  HomeObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation
import SwiftUI

final class HomeObservableObject: BaseObservableObject {
    @Published private(set) var sceneViewModel: HomeViewModel?

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

                return HomeViewModel(userName: userName, alarmName: alarmName, alarmAddress: alarmAddrees)
            }
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .assign(to: &$sceneViewModel)

    }
}
