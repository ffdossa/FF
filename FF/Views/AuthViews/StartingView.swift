//
//  StartingView.swift
//  FF
//
//  Created by Andrii Marchuk on 22.02.2025.
//

import SwiftUI

struct StartingView: View {
    var body: some View {
        NavigationView {
            VStack {
                TitleText(title: "Welcome\nto\nFF app",
                          alignment: .center)

                Spacer()

                VStack(spacing: 12) {
                    NavigationLink {
                        SignUpView()
                    } label: {
                        LinkLabel(title: "Sign up",
                                  titleColor: Colors.whiteColor,
                                  backgroundColor: .clear)
                    }

                    NavigationLink {
                        LogInView()
                    } label: {
                        LinkLabel(title: "Log in",
                                  titleColor: Colors.basicColor,
                                  backgroundColor: Colors.whiteColor)
                    }
                }
            }
            .padding()

            .background(Colors.basicColor)
        }
    }
}

struct LoginTextField: View {
    let text: Binding<String>

    var body: some View {
        TextField("Phone, email, or username", text: text)
            .multilineTextAlignment(.center)
            .foregroundStyle(Colors.basicColor)
            .tint(Colors.basicColor)
            .font(.headline)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Colors.whiteColor)
                    .frame(height: 48)
            }
    }
}

struct PasswordSecureField: View {
    let text: Binding<String>

    var body: some View {
        SecureField("Password", text: text)
            .multilineTextAlignment(.center)
            .foregroundStyle(Colors.basicColor)
            .tint(Colors.basicColor)
            .font(.headline)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Colors.whiteColor)
                    .frame(height: 48)
            }
    }
}

struct MainButton: View {
    let title: String
    let titleColor: Color
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(backgroundColor)
                    .frame(height: 48)
                Text(title)
                    .font(.headline)
                    .foregroundStyle(titleColor)
                    .bold()
            }
        }
    }
}

struct LinkLabel: View {
    let title: String
    let titleColor: Color
    let backgroundColor: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(backgroundColor)
                .frame(height: 48)
            Text(title)
                .font(.headline)
                .foregroundStyle(titleColor)
                .bold()
        }
    }
}

struct TitleText: View {
    let title: String
    let alignment: TextAlignment

    var body: some View {
        Text(title)
            .multilineTextAlignment(alignment)
            .foregroundStyle(Colors.whiteColor)
            .font(.largeTitle)
            .bold()
    }
}

struct SubtitleText: View {
    let subtitle: String

    var body: some View {
        Text(subtitle)
            .multilineTextAlignment(.leading)
            .foregroundStyle(Colors.whiteColor)
            .font(.subheadline)
    }
}

struct ToolBarButton: View {
    var image: Image
    var someAction: () -> Void

    var body: some View {
        Button {
            someAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Colors.whiteColor)
                    .frame(width: 48, height: 48)

                image
                    .tint(Colors.basicColor)
            }
        }
    }
}

#Preview {
    StartingView()
        .background(Colors.basicColor)
}
