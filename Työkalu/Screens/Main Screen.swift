//
// 📄 Main Screen.swift
// 👨🏼‍💻 Author: Benno Kress
//

import SwiftUI

struct MainScreen: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

}

#Preview {
    MainScreen()
}
