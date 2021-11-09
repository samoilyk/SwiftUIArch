//
//  NetworkService.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

final class NetworkService {
    func executeMutation<T>(mutation: T) async throws -> T {
        try await Task.sleep(nanoseconds: 3_000_000_000)
        return mutation
    }
}
