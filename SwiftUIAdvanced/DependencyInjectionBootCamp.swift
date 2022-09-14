//
//  DependencyInjectionBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 14/09/2022.
//

import SwiftUI
import Combine


struct PostsModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class ProductionDataService {
    static let instance = ProductionDataService() // singleton

    let url: URL = URL(string: "https://jsonplaceholder.typicode.com/posts")!

    func getData() -> AnyPublisher<[PostsModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}


class DependencyInjectionViewModel: ObservableObject {
    @Published var dataArray: [PostsModel] = []
    var cancellables = Set<AnyCancellable>()

    init() {
        loadPosts()
    }

    private func loadPosts() {
        ProductionDataService.instance.getData()
            .sink { _  in

            } receiveValue: { [weak self] returnedPosts in
                self?.dataArray = returnedPosts
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootCamp: View {

    @StateObject private var vm  = DependencyInjectionViewModel()

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
    static var previews: some View {
        DependencyInjectionBootCamp()
    }
}
