//
//  CustomViewModifierBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 08/09/2022.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    let backgroundColor: Color
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()

        //need to check on the modiifers to put inside the custom (fonts, padding) shouldnt be put in custom modifier
    }
    
}
extension View {
    func withDefaultButtonFormatting(backgroundColor: Color) -> some View {
        self.modifier(DefaultButtonViewModifier(backgroundColor: backgroundColor))
    }
}

struct CustomViewModifierBootCamp: View {
    var body: some View {
        VStack {

            Text("Hello World Me")
                .modifier(DefaultButtonViewModifier(backgroundColor: .pink)) // works as default modifier

            Text("Hello World")
                .withDefaultButtonFormatting(backgroundColor: .yellow) // using view extension to work like .font()

            Text("Hello World")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
                .padding()

        }
    }
}

struct CustomViewModifierBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifierBootCamp()
    }
}
