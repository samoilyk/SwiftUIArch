//
//  HomeResource.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation


protocol HomeResource {
    func loadData() async -> Result<GlobalState.AlarmState, Error>
}

struct ProductionHomeResource: HomeResource {
    private var networkResource: NetworkResource

    init(networkResource: NetworkResource) {
        self.networkResource = networkResource
    }

    func loadData() async -> Result<GlobalState.AlarmState, Error> {
        await networkResource.executeMutation(mutation: GlobalState.AlarmState(userName: "Initial User Name", alarmName: "Initial Alarm Name", alarmAddress: "Initial Alarm Address"))
    }
}
