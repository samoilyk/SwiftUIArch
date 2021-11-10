//
//  GlobalState.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Combine
import Foundation


final class GlobalState {
    struct Model {
        var userName: String?
        var alarmName: String?
        var alarmAddress: String?
    }

    var value: Model {
        didSet {
            subject.send(value)
        }
    }

    init() {
        self.value = Model()
    }

    lazy var subject: CurrentValueSubject<Model, Never> = CurrentValueSubject(value)
}
