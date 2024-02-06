//
//  SignInButtonView.swift
//  AppBuilder-111111
//
//  Created by Denis Ravkin on 06.02.2024.
//

import SwiftUI

struct SignInButtonView: View {
    let imageView: AnyView
    let text: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0) {
                imageView
                    .padding(.leading, 14)
                    .padding(.trailing, 40)
                
                Text(text)
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(.white)
                    .lineLimit(1)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(backgroundColor)
            .cornerRadius(30)
        }
        .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 4)
    }
}
