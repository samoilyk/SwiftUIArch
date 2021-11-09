//
//  GlobalState.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Combine
import Foundation


final class GlobalState {
    struct AlarmState {
        var userName: String?
        var alarmName: String?
        var alarmAddress: String?
    }

    var value: AlarmState {
        didSet {
            subject.send(value)
        }
    }

    init() {
        self.value = AlarmState()
    }

    lazy var subject: CurrentValueSubject<AlarmState, Never> = CurrentValueSubject(value)
}
