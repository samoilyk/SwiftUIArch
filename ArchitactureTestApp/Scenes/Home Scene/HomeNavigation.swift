//
//  HomeNavigation.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 10.11.2021.
//

import SwiftUI

struct HomeNavigation {
    enum Link: NavigationLinks {
        case userName, alarmName, alarmAddress
    }

    var link: Link?
    var alert: AlertModel?
}
