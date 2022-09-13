//
//  AnyTransitionBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 09/09/2022.
//

import SwiftUI

struct AnyTransitionBootCamp: View {
    @State private var showRectangle: Bool = false
    var body: some View {
        VStack {
            Spacer()
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.move(edge: .leading))
            }
            Spacer()
            Text("Click Me!")
                .withDefaultButtonFormatting(backgroundColor: .red)
                .padding(.horizontal, 40)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

struct AnyTransitionBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        AnyTransitionBootCamp()
    }
}
