//
//  GeometryPreferenceKeyBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 14/09/2022.
//

import SwiftUI

struct GeometryPreferenceKeyBootCamp: View {
    @State private var rectSize: CGSize = .zero

    var body: some View {
        VStack {
            Text("Hello World")
                .frame(width: rectSize.width, height: rectSize.height)
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                GeometryReader { geo in
                    Rectangle()
                        .updateRectangleGeoSize(geo.size)

                }

                Rectangle()
            }
            .frame(height: 55)
        }
        .onPreferenceChange(RectangleGeometrySizePreferenceKey.self, perform: { value in
            self.rectSize = value
        })
    }
}

struct GeometryPreferenceKeyBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GeometryPreferenceKeyBootCamp()
    }
}

extension View {
    func updateRectangleGeoSize(_ size: CGSize) -> some View {
        preference(key: RectangleGeometrySizePreferenceKey.self, value: size)
    }
}


struct RectangleGeometrySizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero

    static func reduce(value: inout CGSize , nextValue: () -> CGSize) {
        value = nextValue()
    }
}
