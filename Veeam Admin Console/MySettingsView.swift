//
//  MySettingsView.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 20.03.24.
//

//import Foundation
import SwiftUI

struct MySettingsView: View {

    private let test = ["username": "HOMELAB\\Administrator", "password": "HomeLab4m3x!", "grant_type": "password"]
    private let veeamConnection: VeeamConnection

    init() {
        self.veeamConnection = VeeamConnection(baseURL: "https://192.168.30.30:9419/api/oauth2/token", headerData: test, username: "HOMELAB\\Administrator", password: "HomeLab4m3!")
    }

    var body: some View {
        Text("Test")
            .onAppear{
                print("Obtain Bearer")
                veeamConnection.obtainBearerToken { token in
                    print(token)
                }
            }
    }
}

#Preview {
    MySettingsView()
}
