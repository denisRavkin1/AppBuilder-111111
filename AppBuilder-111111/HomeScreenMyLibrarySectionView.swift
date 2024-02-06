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
//    @State private var width: CGFloat = 0
    
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
//        .frame(height: width)
//        .readWidth(onChange: { width = $0 })
        .background(section.gradient)
        .cornerRadius(10)
    }
}

struct HomeScreenMyLibrarySectionView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenMyLibrarySectionView(section: .blog, count: 5)
    }
}

extension View {
    public func readHeight(onChange: @escaping (CGFloat) -> Void) -> some View {
        background(
            GeometryReader { proxy in
                Spacer()
                    .preference(
                        key: HeightPreferenceKey.self,
                        value: proxy.size.height
                    )
            }
        )
            .onPreferenceChange(HeightPreferenceKey.self, perform: onChange)
    }
}
public struct HeightPreferenceKey: PreferenceKey {
    public static var defaultValue: CGFloat = .zero
    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}

extension View {
    public func readWidth(onChange: @escaping (CGFloat) -> Void) -> some View {
        background(
            GeometryReader { proxy in
                Spacer()
                    .preference(
                        key: WidthPreferenceKey.self,
                        value: proxy.size.width
                    )
            }
        )
            .onPreferenceChange(WidthPreferenceKey.self, perform: onChange)
    }
}

public struct WidthPreferenceKey: PreferenceKey {
    public static var defaultValue: CGFloat = .zero
    public static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {}
}
