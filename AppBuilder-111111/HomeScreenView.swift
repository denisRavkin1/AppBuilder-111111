//
//  HomeScreenView.swift
//  AppBuilder-111111
//
//  Created by Denis Ravkin on 05.02.2024.
//

import SwiftUI

enum HomeScreenMyLibrarySection: CaseIterable {
    case products
    case services
    case blog
    case events
    
    var name: String {
        switch self {
        case .products:
            return "Products"
        case .services:
            return "Services"
        case .blog:
            return "Blog"
        case .events:
            return "Events"
        }
    }

    var gradient: LinearGradient {
        switch self {
        case .products:
            return LinearGradient(colors: [ Color(red: 207 / 255, green: 77 / 255, blue: 255 / 255), Color(red: 255 / 255, green: 220 / 255, blue: 142 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .services:
            return LinearGradient(colors: [Color(red: 139 / 255, green: 77 / 255, blue: 255 / 255), Color(red: 142 / 255, green: 242 / 255, blue: 255 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .blog:
            return LinearGradient(colors: [Color(red: 132 / 255, green: 77 / 255, blue: 255 / 255), Color(red: 142 / 255, green: 255 / 255, blue: 190 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing)
        case .events:
            return LinearGradient(colors: [Color(red: 132 / 255, green: 77 / 255, blue: 255 / 255), Color(red: 255 / 255, green: 154 / 255, blue: 154 / 255)], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
    
    var imageName: String {
        switch self {
        case .products:
            return "storefront.fill"
        case .services:
            return "storefront.fill"
        case .blog:
            return "storefront.fill"
        case .events:
            return "storefront.fill"
        }
    }
}

class HomeScreenViewModel: ObservableObject {
    @Published var appName: String = "My App Name"
    @Published var appDescription: String = "This is the main page of your application"
    @Published var emptyPageInfo: String = """
Your page is empty
Tap Edit to add your first widget now!
"""
    @Published var pageId: String? = nil
    
}

struct HomeScreenView: View {
    @ObservedObject var viewModel: HomeScreenViewModel = .init()
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 230), spacing: 20, alignment: .trailing),
        GridItem(.adaptive(minimum: 100, maximum: 230), spacing: 0, alignment: .leading)
    ]
    
    var body: some View {
        ScrollView {
            mainSectionView
            HStack {
                Text("MY LIBRARY")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black.opacity(0.8))
                Spacer()
            }
            .padding(.top, 6)
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(HomeScreenMyLibrarySection.allCases, id: \.self) { section in
                    HomeScreenMyLibrarySectionView(section: section, count: 5)
                        
                }
            }
        }
    }
    
    private var mainSectionView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Circle()
                    .fill(.white.opacity(0.5))
                    .frame(width: 64, height: 64)
                VStack(alignment: .leading, spacing: 5) {
                    Text(viewModel.appName)
                        .font(.system(size: 18, weight: .bold))
                    
                    Text(viewModel.appDescription)
                        .font(.system(size: 14))
                }
                Spacer()
            }
            if viewModel.pageId == nil {
                HStack {
                    Text(viewModel.emptyPageInfo)
                        .font(.system(size: 14))
                    Spacer()
                    Image("pencil.and.scribble")
                }
            }
            HStack {
                mainSectionButton(imageName: "pencil.tip.crop.circle.fill", text: "Edit", action: {})
                mainSectionButton(imageName: "eye.fill", text: "Preview", disabled: viewModel.pageId == nil, action: {})
                Spacer()
                mainSectionButton(imageName: "gearshape.fill", text: nil, action: {})
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(LinearGradient(colors: [Color(red: 132 / 255, green: 77 / 255, blue: 255 / 255), Color(red: 186 / 255, green: 142 / 255, blue: 255 / 255)], startPoint: .leading, endPoint: .trailing))
        .cornerRadius(10)
    }
    
        func mainSectionButton(imageName: String, text: String?, disabled: Bool = false, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Image(imageName)
                if let text = text {
                    Text(text)
                        .font(.system(size: 14))
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                }
            }
            .padding(5)
            .frame(height: 36)
            .background(.white.opacity(0.2))
            .cornerRadius(18)
            .opacity(disabled ? 0.5 : 1)
        }
        .disabled(disabled)
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
