//
//  ProtocolBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 14/09/2022.
//

import SwiftUI

struct DefaultColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativeColorTheme: ColorThemeProtocol {
    let primary: Color = .red
    let secondary: Color = .white
    let tertiary: Color = .green
}

struct AnotherColorTheme: ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .purple
}

protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

struct ProtocolBootCamp: View {

    //let colorTheme: DefaultColorTheme = DefaultColorTheme()
    //let colorTheme: AlternativeColorTheme = AlternativeColorTheme()

    let colorTheme: ColorThemeProtocol = AnotherColorTheme()
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()

            Text("Protocolas are awersome")
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }

    }
}

struct ProtocolBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ProtocolBootCamp()
    }
}
