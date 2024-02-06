//
//  Extensions.swift
//  AppBuilder-111111
//
//  Created by Denis Ravkin on 06.02.2024.
//

import Foundation
import SwiftUI

extension View {
    public var anyView: AnyView { AnyView(self) }
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
