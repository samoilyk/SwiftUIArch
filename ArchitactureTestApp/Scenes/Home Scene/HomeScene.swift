//
//  HomeScene.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

struct HomeViewModel: Equatable {
    let userName: String
    let alarmName: String
    let alarmAddress: String
}

struct HomeScene: View {
    @StateObject var homeObservableObject: HomeObservableObject
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        NavigationView {
            List {
                NavigationLink("User Name", destination: navigation.userNameScene)
                NavigationLink("Alarm Name", destination: AlarmNameScene())
                NavigationLink("Alarm Address", destination: AlarmAddressScene())
            }
        }
        .navigationTitle("Home Scene")
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene(homeObservableObject: HomeObservableObject(state: GlobalState(), resource: ProductionHomeResource(networkResource: NetworkResource())))
    }
}
