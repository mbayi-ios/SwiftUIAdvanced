//
//  DependencyInjectionBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 14/09/2022.
//

import SwiftUI
import Combine

// problem with singletons
// 1. They are global - you can access it from anywhere
// 2. We cant customize the init
// 3. we cant swap out dependencies

// - the solution to not using singleton is to use DI

struct PostsModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}



protocol DataServiceProtocol {
    func getData() -> AnyPublisher<[PostsModel], Error>
}


class ProductionDataService: DataServiceProtocol {
    //static let instance = ProductionDataService() // singleton

    let url: URL

    init(url: URL) {
        self.url = url
    }

    //let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class MockDataService: DataServiceProtocol {

    let testData: [PostsModel] = [
        PostsModel(userId: 1, id: 1, title: "title", body: "Body"),
        PostsModel(userId: 2, id: 2, title: "title 2", body: "body 2")
    ]

    func getData() -> AnyPublisher<[PostsModel], Error> {
        Just(testData)
            .tryMap({ $0 })
            .eraseToAnyPublisher()
    }


}


class DependencyInjectionViewModel: ObservableObject {
    @Published var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()

    let dataService: DataServiceProtocol

    init(dataService: DataServiceProtocol) {
        self.dataService = dataService
        loadPosts()
    }

    private func loadPosts() {
       // ProductionDataService.instance.getData()
        dataService.getData()
            .sink { _  in

            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootCamp: View {

    @StateObject private var vm: DependencyInjectionViewModel

    init(dataService: DataServiceProtocol) {
        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjectionBootCamp_Previews: PreviewProvider {
//    static let dataService = ProductionDataService(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)

    static let dataService = MockDataService()
    static var previews: some View {
        DependencyInjectionBootCamp(dataService: dataService)
    }
}
