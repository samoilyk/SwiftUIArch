//
//  AlertModel.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 10.11.2021.
//

import Foundation
import SwiftUI

struct AlertModel: Identifiable, Hashable {
    enum Action {
        case dismiss(button: Alert.Button? = nil)
        case custom(primary: Alert.Button, secondary: Alert.Button)
    }

    var id: Int {
        hashValue
    }

    let title: String
    let message: String?
    let action: Action

    init(title: String, message: String?, action: AlertModel.Action = .dismiss()) {
        self.title = title
        self.message = message
        self.action = action
    }

    static func == (lhs: AlertModel, rhs: AlertModel) -> Bool {
        lhs.title == rhs.title && lhs.message == rhs.message
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(message)
    }
}

struct AlertModifier: ViewModifier {
    @Binding var model: AlertModel?

    func body(content: Content) -> some View {
        content.alert(item: $model) { model -> Alert in
            switch model.action {
            case .dismiss(button: let button):
                return Alert(title: Text(model.title), message: model.message.map(Text.init), dismissButton: button ?? .cancel())
            case let .custom(primary: primary, secondary: secondary):
                return Alert(title: Text(model.title), message: model.message.map(Text.init), primaryButton: primary, secondaryButton: secondary)
            }
        }
    }
}

extension View {
    func defaultAlert(alertModel: Binding<AlertModel?>) -> some View {
        modifier(AlertModifier(model: alertModel))
    }
}
