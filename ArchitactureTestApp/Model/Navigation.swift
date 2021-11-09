//
//  Navigation.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

final class Navigation: ObservableObject {
    @Published var userNameIsPresented: Bool = false

    private var container: Container

    init(container: Container) {
        self.container = container
    }

    var homeScene: HomeScene {
        let homeObservableObject = HomeObservableObject(
            state: container.globalState,
            resource: ProductionHomeResource(networkResource: container.networkResource)
        )

        return HomeScene(homeObservableObject: homeObservableObject)
    }

    var userNameScene: UserNameScene {
        let userNameObservableObject = UserNameObservableObject(
            state: container.globalState,
            resource: ProductionUserNameResource(networkResource: container.networkResource)
        )
        return UserNameScene(userNameObservableObject: userNameObservableObject)
    }

    var alarmNameScene: AlarmNameScene {
        AlarmNameScene()
    }

    var alarmAddressScene: AlarmAddressScene {
        AlarmAddressScene()
    }
}
