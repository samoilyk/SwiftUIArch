//
//  NetworkService.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

final class NetworkResource {
    func executeMutation<T>(mutation: T) async -> Result<T, Error> {
        do {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            return .success(mutation)
        } catch {
            return .failure(error)
        }
    }
}
