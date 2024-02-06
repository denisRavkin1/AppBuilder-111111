//
//  HomeView.swift
//  AppBuilder-111111
//
//  Created by Denis Ravkin on 06.02.2024.
//

import SwiftUI

struct AppInfo: Hashable {
    let icon: String?
    let name: String
}

class HomeViewModel: ObservableObject {
    @Published var appsInfo: [AppInfo] = [.init(icon: nil, name: "My App 1")]
    @Published var showSubscriptionsInfo = true
    
    func startCreateApp() {
        
    }
}

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel = .init()
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 100, maximum: 230), spacing: 20, alignment: .trailing),
        GridItem(.adaptive(minimum: 100, maximum: 230), spacing: 0, alignment: .leading)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("ClubKit")
                    .font(.system(size: 24, weight: .light))
                Spacer()
                Button {
                    
                } label: {
                    Image("gearshape.fill (1)")
                }
            }
            
            Spacer()
            
            if viewModel.appsInfo.count == 0 {
                noAppsView
            } else {
                myAppsView
            }
            
            Spacer()
        }
        .padding(.horizontal, 8)
    }
    
    @ViewBuilder
    private var noAppsView: some View {
        Button {
            viewModel.startCreateApp()
        } label: {
            cardView(webImageName: nil, imageName: "doc.fill.badge.plus (1)", text: nil, width: 162)
        }
        
        Text("""
Build your first
Branded App
""")
        .font(.system(size: 24, weight: .light))
        .multilineTextAlignment(.center)
    }
    
    @ViewBuilder
    private var myAppsView: some View {
        VStack {
            Text("My Apps")
                .font(.system(size: 32, weight: .light))
                .padding()
            ScrollView {
                LazyVGrid(columns: columns, spacing: 22) {
                    ForEach(viewModel.appsInfo, id: \.self) { appInfo in
                        cardView(webImageName: appInfo.icon, imageName: appInfo.icon, text: appInfo.name, width: .infinity)
                    }
                    cardView(webImageName: nil, imageName: "doc.fill.badge.plus (1)", text: nil, width: .infinity, disabled: viewModel.showSubscriptionsInfo)
                }
                
                if viewModel.showSubscriptionsInfo {
                    HStack(spacing: 20) {
                        Image("arrow.up.circle")
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Upgrade your subscription to build more apps")
                                .font(.system(size: 14, weight: .light))
                            
                            Button {
                                
                            } label: {
                                Text("View all options")
                                    .font(.system(size: 16, weight: .semibold))
                                    .underline()
                                    .foregroundColor(.black)
                            }
                        }
                    }
                    .padding(.vertical, 30)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 255 / 255, green: 0, blue: 0, opacity: 0.05))
                    .cornerRadius(10)
                    .padding(.top, 12)
                }
            }
        }
    }
    
    private func cardView(webImageName: String?, imageName: String?, text: String?, width: CGFloat, disabled: Bool = false) -> some View {
        Button {
            
        } label: {
            VStack {
                if let webImageName = webImageName {
                    //webimage
                } else if let imageName = imageName {
                    Image(imageName)
                } else {
                    Image("app.badge.fill")
                }
                if let text = text {
                    Text(text)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.black)
                }
            }
            .frame(height: 195)
            .frame(maxWidth: width)
            .background(.black.opacity(0.05))
            .cornerRadius(10)
        }
        .opacity(disabled ? 0.55 : 1)
        .disabled(disabled)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
