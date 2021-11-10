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
                HStack {
                    NavigationLink("User Name", destination: navigation.userNameScene)
                    Spacer()
                    Text(homeObservableObject.sceneViewModel?.userName ?? "")
                }
                NavigationLink("Alarm Name", destination: navigation.alarmNameScene)
                NavigationLink("Alarm Address", destination: navigation.alarmAddressScene)
            }
        }
        .onAppear(perform: homeObservableObject.onAppear)
        .navigationTitle("Home Scene")
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene(homeObservableObject: HomeObservableObject(state: GlobalState(), resource: ProductionHomeResource(networkResource: NetworkResource())))
    }
}
