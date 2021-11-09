//
//  UserNameScene.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

struct UserNameScene: View {
    @StateObject var userNameObservableObject: UserNameObservableObject
    @State private var userName: String = ""

    var body: some View {
        TextField("Enter user's name", text: $userName)
            .onSubmit { userNameObservableObject.userNamedChanged(to: userName) }
    }
}

struct UserNameScene_Previews: PreviewProvider {
    static var previews: some View {
        UserNameScene(userNameObservableObject: UserNameObservableObject(state: GlobalState(), resource: ProductionUserNameResource(networkService: NetworkService())))
    }
}
