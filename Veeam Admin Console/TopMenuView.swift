//
//  TopMenuView.swift
//  Veeam Admin Console
//
//  Created by Marco Horstmann on 21.03.24.
//

import SwiftUI

struct TopMenuView: View {
    var body: some View {
        HStack {
            Image("veeamlogo")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.leading)
            Text("Console")
                .font(.custom("AmericanTypeWriter", size: CGFloat(30)))
            Spacer()
            
        }
    }
}

#Preview {
    TopMenuView()
}
