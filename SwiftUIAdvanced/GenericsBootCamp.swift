//
//  GenericsBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 13/09/2022.
//

import SwiftUI

struct StringModel {
    let info: String?

    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?

    func removeInfo() -> BoolModel {
        return BoolModel(info: nil)
    }
}

struct GenericModel<CustomType> {
    let info: CustomType?

    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "hello world")
    @Published var boolModel = BoolModel(info: true)

    //generic types
    @Published var genericStringModel = GenericModel(info: "Generic String Amby")
    @Published var genericBoolModel  = GenericModel(info: true)

    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()

        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericsBootCamp: View {
    @StateObject private var vm = GenericsViewModel()

    var body: some View {
        VStack {
            Text(vm.stringModel.info ?? "not data")
            Text(vm.boolModel.info?.description ?? "no data")

            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")

        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericsBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootCamp()
    }
}
