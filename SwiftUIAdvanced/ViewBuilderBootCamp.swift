//
//  ViewBuilderBootCamp.swift
//  SwiftUIAdvanced
//
//  Created by Amby on 13/09/2022.
//

import SwiftUI


struct HeaderViewRegular: View {
    let title: String
    let description: String?
    let iconName: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)

            if let description = description {
                Text("description")
                    .font(.callout)
            }

            if let iconName = iconName {
                Image(systemName: iconName)
            }

            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }

}

struct HeaderViewGeneric<Content:View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.semibold)

            content

            RoundedRectangle(cornerRadius: 5)
                .frame(height: 2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct CustomHStack<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderBootCamp: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title One", description: "hello", iconName: "heart.fill")
            HeaderViewRegular(title: "Title One", description: nil, iconName: nil)

            Divider()
            //
            //            HeaderViewGeneric(title: "Generic Title", content: Text("hello"))
            //
            //            HeaderViewGeneric(title: "generic 2", content: Image(systemName: "heart.fill"))

            HeaderViewGeneric(title: "Generic Title") {

                HStack {
                    Text("Hi View Builder")
                    Image(systemName: "heart.fill")
                }

            }

            CustomHStack {
                Text("hello")
                Text("hello")
                Text("hello")
            }


            Spacer()
        }

    }
}

struct ViewBuilderBootCamp_Previews: PreviewProvider {
    static var previews: some View {
        LocalViewBuilder(type: .two)
    }
}


struct LocalViewBuilder: View {

    enum ViewType {
        case one, two, three
    }

    let type: ViewType

    var body: some View {
        VStack {
            headerSection
        }
    }

    @ViewBuilder private var headerSection: some View {
        switch type {
        case .one:
            viewOne
        case .two:
            viewTwo
        case .three:
            viewThree
        }
    }

    private var viewOne: some View {
        Text("one")
    }

    private var viewTwo: some View {

        VStack {
            Text("two and")
            Image(systemName: "heart.fill")
        }
    }
    
    private var viewThree: some View {
        Image(systemName: "heart.fill")

    }
}
