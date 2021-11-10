//
//  HomeNavigation.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 10.11.2021.
//

import SwiftUI

struct HomeNavigation {
    enum Sheet: Int, Identifiable, View {
        case settings
        case logout

        var id: Int {
            rawValue
        }

        var body: some View {
            switch self {
            case .settings:
                SettingsScene()
            case .logout:
                EmptyView()
            }
        }
    }

    enum Link: NavigationLinks {
        case userName, alarmName, alarmAddress
    }

    var link: Link?
    var sheet: Sheet?
    var alert: AlertModel?
}
