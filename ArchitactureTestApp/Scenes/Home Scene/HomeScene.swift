//
//  HomeScene.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

struct HomeSceneData: Equatable {
    let userName: String
    let alarmName: String
    let alarmAddress: String
}

struct HomeScene: View {
    @StateObject var homeObservableObject: HomeObservableObject
    @EnvironmentObject var navigation: NavigationObservableObject

    var body: some View {
        NavigationView {
            List {
                HStack {
                    Button("User Name", action: userNameButtonTapped)
                    Text(homeObservableObject.sceneData?.userName ?? "")
                }
                HStack {
                    Button("Alarm Name", action: { navigation.homeNavigation.link = .alarmName })
                    Text(homeObservableObject.sceneData?.alarmName ?? "")
                }
                HStack {
                    Button("Alarm Address", action: { navigation.homeNavigation.link = .alarmAddress })
                    Text(homeObservableObject.sceneData?.alarmAddress ?? "")
                }
            }
            .onAppear(perform: homeObservableObject.onAppear)
            .navigationTitle("Home Scene")
            .navigationTo {
                HomeNavigation.Link.userName.link(
                    to: navigation.userNameScene,
                    selection: $navigation.homeNavigation.link
                )

                HomeNavigation.Link.alarmName.link(
                    to: navigation.alarmNameScene,
                    selection: $navigation.homeNavigation.link
                )

                HomeNavigation.Link.alarmAddress.link(
                    to: navigation.alarmAddressScene,
                    selection: $navigation.homeNavigation.link
                )
            }
            .sheet(item: $navigation.homeNavigation.sheet) {
                $0.environmentObject(navigation)
            }
        }
    }

    func userNameButtonTapped() {
        navigation.homeNavigation.link = .userName
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene(homeObservableObject: HomeObservableObject(state: GlobalState(), resource: ProductionHomeResource(networkResource: NetworkResource())))
    }
}
