//
//  MainMenu.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 19.03.24.
//


import SwiftUI

struct MainMenuView: View {
    var body: some View {
        //Text(LocalizedStringResource("Username"))
        TabView {
            ContentView()
                .tabItem {
                    Label(LocalizedStringKey("Jobs"), systemImage: "list.dash")
                }
            MySettingsView()
                .tabItem {
                    Label(LocalizedStringKey("Settings"), systemImage: "list.dash")
                }
        }
    }
}

#Preview("en") {
    MainMenuView()
        .environment(\.locale, .init(identifier: "en"))
}
#Preview("de") {
    MainMenuView()
        .environment(\.locale, .init(identifier: "de"))
}
