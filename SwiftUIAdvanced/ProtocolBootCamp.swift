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

protocol ButtonPressedProtocol {
    func buttonPressed()
}

protocol ButtonTextProtocol {
    var buttonText: String { get }
}

class DefaultDataSource: ButtonTextProtocol {
    var buttonText: String = "protocols are awesome"

    func buttonPressed() {
        print("button was presed")
    }

}

class AlternativeDataSource: ButtonTextProtocol {
    func buttonPressed() {
        print("hey button pressed")
    }

    var buttonText: String = "protocols are lame"
}

struct ProtocolBootCamp: View {

    //let colorTheme: DefaultColorTheme = DefaultColorTheme()
    //let colorTheme: AlternativeColorTheme = AlternativeColorTheme()

    let colorTheme: ColorThemeProtocol = AnotherColorTheme()
    let dataSource: ButtonTextProtocol

    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()

            Text(dataSource.buttonText)
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
        ProtocolBootCamp(dataSource: DefaultDataSource())
    }
}
