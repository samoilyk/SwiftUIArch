//
//  UserNameScene.swift
//  ArchitactureTestApp
//
//  Created by Ievgen Samoilyk on 08.11.2021.
//

import SwiftUI

struct UserNameSceneData: Equatable {
    let userName: String
}

struct UserNameScene: View {
    @StateObject var userNameObservableObject: UserNameObservableObject
    @State private var userName: String = ""

    var body: some View {
        switch userNameObservableObject.loadingState {
        case .success:
            if let initialUserName = userNameObservableObject.sceneData?.userName {
                VStack {
                    Text("User's name: \(initialUserName)")
                    TextField("Enter new user's name", text: $userName)
                        .onSubmit { userNameObservableObject.userNamedChanged(to: userName) }
                }
            } else {
                VStack {
                    Text("No data")
                    TextField("Enter new user's name", text: $userName)
                        .onSubmit { userNameObservableObject.userNamedChanged(to: userName) }
                }
            }

        case .error(let error):
            Text("Error accured: \(error.localizedDescription)")
        case .isLoading:
            Text("Is loading")
        }
    }
}

struct UserNameScene_Previews: PreviewProvider {
    static var previews: some View {
        UserNameScene(userNameObservableObject: UserNameObservableObject(state: GlobalState(), resource: ProductionUserNameResource(networkResource: NetworkResource())))
    }
}
