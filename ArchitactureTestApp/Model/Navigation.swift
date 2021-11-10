//
//  Navigation.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 10.11.2021.
//

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
