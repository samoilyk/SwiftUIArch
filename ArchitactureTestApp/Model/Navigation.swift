//
//  Navigation.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 09.11.2021.
//

import Foundation

final class Navigation: ObservableObject {
    @Published var userNameIsPresented: Bool = false

    private var container: Container

    init(container: Container) {
        self.container = container
    }

    var homeScene: HomeScene {
        let homeObservableObject = HomeObservableObject(
            state: container.globalState,
            resource: ProductionHomeResource(networkResource: container.networkResource)
        )

        return HomeScene(homeObservableObject: homeObservableObject)
    }

    var userNameScene: UserNameScene {
        let userNameObservableObject = UserNameObservableObject(
            state: container.globalState,
            resource: ProductionUserNameResource(networkResource: container.networkResource)
        )
        return UserNameScene(userNameObservableObject: userNameObservableObject)
    }

    var alarmNameScene: AlarmNameScene {
        AlarmNameScene()
    }

    var alarmAddressScene: AlarmAddressScene {
        AlarmAddressScene()
    }
}


import SwiftUI

protocol NavigationLinks: Hashable {
    func link<Destination: View>(to destination: Destination, selection: Binding<Self?>) -> NavigationLink<EmptyView, Destination>
}

extension NavigationLinks {
    func link<Destination: View>(to destination: Destination, selection: Binding<Self?>) -> NavigationLink<EmptyView, Destination> {
        NavigationLink(destination: destination, tag: self, selection: selection, label: EmptyView.init)
    }
}

struct Navigator<Links: View>: ViewModifier {
    let navigationLinks: Links

    init(@ViewBuilder links: @escaping () -> Links) {
        navigationLinks = links()
    }

    init(links: Links) {
        navigationLinks = links
    }

    func body(content: Content) -> some View {
        ZStack {
            navigationLinks
            content
        }
    }
}

extension View {
    func navigationTo<Links: View>(@ViewBuilder links: @escaping () -> Links) -> some View {
        modifier(Navigator(links: links))
    }
}

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

