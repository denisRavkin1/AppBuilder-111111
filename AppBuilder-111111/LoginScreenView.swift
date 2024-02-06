//
//  LoginScreenView.swift
//  AppBuilder-111111
//
//  Created by Denis Ravkin on 06.02.2024.
//

import SwiftUI

class LoginScreenViewModel: ObservableObject {
    
}

struct LoginScreenView: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 90) {
                VStack(spacing: 4) {
                    Text("Welcome")
                        .font(.system(size: 32, weight: .light))
                    Text("Let’s start by creating your Account")
                        .font(.system(size: 16, weight: .light))
                }
                
                VStack(spacing: 17) {
                    SignInButtonView(imageView: Image("g.circle.fill 1").anyView, text: "Continue with Google", backgroundColor: Color(red: 255 / 255, green: 99 / 255, blue: 99 / 255), action: {})
                    SignInButtonView(imageView: Image("apple.logo 1").padding(.horizontal, 6.5).anyView, text: "Continue with Apple", backgroundColor: .black, action: {})
                }
                .padding(.horizontal, 7)
            }
            
            Spacer()
            
            Group {
                Text("By registering you’re accepting the ")
                + Text("[ClubKit’s Privacy Policy](https://www.android.com/intl/en_in/)")
                    .underline()
                + Text(" and ")
                + Text("[Terms of Use](https://www.apple.com/in/)")
                    .underline()
            }
            .multilineTextAlignment(.center)
            .font(.system(size: 17))
            .padding(.horizontal)
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}
