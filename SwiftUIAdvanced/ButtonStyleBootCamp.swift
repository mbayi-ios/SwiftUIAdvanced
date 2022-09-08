//
//  ButtonStyleBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 08/09/2022.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {

    let scaledAmount: CGFloat

    //using ddefault value in custom initializer
    init(scaledAmount: CGFloat) {
        self.scaledAmount = scaledAmount
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount: 1.0)
            //.brightness(configuration.isPressed ? 0.05: 0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

extension View {
    func withPressableStyle(scaledAmount: CGFloat = 0.9) -> some View {
        self.buttonStyle(PressableButtonStyle(scaledAmount: scaledAmount))
    }
}

struct ButtonStyleBootCamp: View {

    var body: some View {
        Button(action: {

        }, label: {
            Text("Click Me")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
        })
            //.buttonStyle(PressableButtonStyle(scaledAmount: 0.5))
            .withPressableStyle(scaledAmount: 1.2)
    }
}

struct ButtonStyleBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleBootCamp()
    }
}
