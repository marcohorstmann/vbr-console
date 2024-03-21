//
//  MySettingsView.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 20.03.24.
//

//import Foundation
import SwiftUI

struct MySettingsView: View {
    var body: some View {
        // VeeamConnection.obtainBearerToken(baseURL: "https://192.168.30.30:9419/api/oauth2/token", username: "HOMELAB\\Administrator", password: "HomeLab4m3!")
        let test = ["username": "HOMELAB\\Administrator", "password": "HomeLab4m3!", "grant_type": "password"]
        let veeamConnection = VeeamConnection.obtainBearerToken(baseURL: "https://192.168.30.30:9419/api/oauth2/token", username: "HOMELAB\\Administrator", password: "HomeLab4m3!", headerData: test, completion: <#(String?) -> Void#>)
        Text("Test")
    }
}

#Preview {
    MySettingsView()
}
