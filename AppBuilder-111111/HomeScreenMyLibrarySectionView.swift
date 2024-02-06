//
//  HomeScreenMyLibrarySectionView.swift
//  AppBuilder-111111
//
//  Created by Denis Ravkin on 05.02.2024.
//

import SwiftUI

struct HomeScreenMyLibrarySectionView: View {
    let section: HomeScreenMyLibrarySection
    let count: Int
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Spacer()
                
                Text("\(count)")
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    .background(.white.opacity(0.2))
                    .cornerRadius(18)
                    .font(.system(size: 14, weight: .bold))
            }
            .padding(.top, 10)
            .padding(.trailing, 9)
            Image("storefront.fill")
            Text(section.name)
                .font(.system(size: 16, weight: .bold))
                .padding(.bottom)
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .background(section.gradient)
        .cornerRadius(10)
    }
}

struct HomeScreenMyLibrarySectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenMyLibrarySectionView(section: .blog, count: 5)
    }
}
