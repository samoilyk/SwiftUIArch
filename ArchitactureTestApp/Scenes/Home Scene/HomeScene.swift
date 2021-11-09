//
//  HomeScene.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

struct HomeScene: View {
    @StateObject var homeObservableObject: HomeObservableObject

    var body: some View {
        NavigationView {
            List {
                NavigationLink("User Name",destination: UserNameScene(userNameObservableObject: UserNameObservableObject(state: homeObservableObject.globalState, resource: ProductionUserNameResource(networkService: NetworkService()))))
                NavigationLink("Alarm Name", destination: AlarmNameScene())
                NavigationLink("Alarm Address", destination: AlarmAddressScene())
            }
        }
        .navigationTitle("Home Scene")
    }
}

struct HomeScene_Previews: PreviewProvider {
    static var previews: some View {
        HomeScene(homeObservableObject: HomeObservableObject(globalState: GlobalState()))
    }
}
