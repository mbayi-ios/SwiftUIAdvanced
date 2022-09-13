//
//  GenericsBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 13/09/2022.
//

import SwiftUI

class GenericsViewModel: ObservableObject {
    @Published var dataArray: [String] = []

    init() {
        dataArray = ["one", "two", "three"]
    }

    func removeDataFromDataArray() {
        dataArray.removeAll()
    }
}

struct GenericsBootCamp: View {
    @StateObject private var vm = GenericsViewModel()
    var body: some View {
        VStack {
            ForEach(vm.dataArray, id: \.self) { item in
                Text(item)
                    .onTapGesture {
                        vm.removeDataFromDataArray()
                    }
            }
        }
    }
}

struct GenericsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootCamp()
    }
}
