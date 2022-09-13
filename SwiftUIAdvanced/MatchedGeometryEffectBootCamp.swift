//
//  MatchedGeometryEffectBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 13/09/2022.
//

import SwiftUI

struct MatchedGeometryEffectBootCamp: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace

    var body: some View {
        VStack {
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)

            }

            Spacer()

            if isClicked {
            RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                .frame(width: 400, height: 300)

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut){
                isClicked.toggle()
            }
        }
    }
}

struct MatchedGeometryEffectBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        //MatchedGeometryEffectBootCamp()
        MatchedGoemetryEffectExample2()
    }
}

struct MatchedGoemetryEffectExample2: View {
    let categories: [String] = ["Home", "Popular", "Saved"]

    @State private var selected: String = ""
    @Namespace private var namespace2

    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "category_background", in: namespace2)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
    }
}
