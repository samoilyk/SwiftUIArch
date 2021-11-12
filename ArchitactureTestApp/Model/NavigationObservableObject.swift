//
//  NavigationObservableObject.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation
import SwiftUI

final class NavigationObservableObject: ObservableObject {
    @Published var homeNavigation: HomeNavigation = HomeNavigation()

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

    var userNameScene: UserNameComponent {
        let userNameObservableObject = UserNameObservableObject(
            state: container.globalState,
            resource: ProductionUserNameResource(networkResource: container.networkResource)
        )
        return UserNameComponent(userNameObservableObject: userNameObservableObject)
    }

    var alarmNameScene: AlarmNameScene {
        AlarmNameScene()
    }

    var alarmAddressScene: AlarmAddressScene {
        AlarmAddressScene()
    }
}
