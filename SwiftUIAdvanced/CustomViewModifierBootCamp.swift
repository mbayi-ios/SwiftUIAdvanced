//
//  CustomViewModifierBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 08/09/2022.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()

        //need to check on the modiifers to put inside the custom
    }
    
}
extension View {
    func withDefaultButtonFormatting() -> some View {
        self.modifier(DefaultButtonViewModifier())
    }
}

struct CustomViewModifierBootCamp: View {
    var body: some View {
        VStack {

            Text("Hello World Me")
                .modifier(DefaultButtonViewModifier()) // works as default modifier

            Text("Hello World")
                .withDefaultButtonFormatting() // using view extension to work like .font()


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
