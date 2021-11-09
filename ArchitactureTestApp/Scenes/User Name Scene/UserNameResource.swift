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
    private var networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func changeUserName(to newValue: String) async -> Result<String, Error> {
        do {
            let name = try await networkService.executeMutation(mutation: newValue)
            return .success(name)
        } catch {
            return .failure(error)
        }
    }
}
