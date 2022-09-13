//
//  PreferenceKeyBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 13/09/2022.
//

import SwiftUI

struct PreferenceKeyBootCamp: View {
    @State private var text: String = "hello worldd"
    var body: some View {
        NavigationView {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
                    .customTitle(text: "New Value!!")

            }

        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

extension View {
    func customTitle(text: String) -> some View {
        self
            .preference(key: CustomTitlePreferenceKey.self, value: text)
    }
}

struct PreferenceKeyBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceKeyBootCamp()
    }
}


struct SecondaryScreen: View {
    let text: String
    var body: some View {
        Text(text)
            .preference(key: CustomTitlePreferenceKey.self, value: "New Value")
    }
}


struct CustomTitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = ""

    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}
