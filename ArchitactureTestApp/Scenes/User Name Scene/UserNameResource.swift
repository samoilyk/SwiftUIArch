//
//  UserNameResource.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

protocol UserNameResource {
    func changeUserName(to newValue: String) async -> Result<String, Error>
}

struct ProductionUserNameResource: UserNameResource {
    private var networkResource: NetworkResource

    init(networkResource: NetworkResource) {
        self.networkResource = networkResource
    }

    func changeUserName(to newValue: String) async -> Result<String, Error> {
        await networkResource.executeMutation(mutation: newValue)
    }
}
