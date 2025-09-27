//
//  LoginView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 13.09.25.
//

import SwiftUI

struct LoginView: View {
    @State private var countryCode: String = "+1"
    @State private var phone: String = ""
    @State private var remember: Bool = false

    var body: some View {
        ZStack {
            // Background
            Image("gym_bg")
                .resizable()
                .scaledToFit()
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.black.opacity(0.35)) // dim

            VStack {
                HStack {
                    Spacer()
                    Text("Visitor")
                        .font(.caption)
                        .foregroundColor(Color.orange)
                        .padding(.trailing, 20)
                }
                Spacer()
            }

            VStack(spacing: 24) {
                Text("Gym Bob")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 24)

                VStack(spacing: 16) {
                    Text("Enter Your Phone")
                        .foregroundColor(.white)
                        .font(.headline)

                    HStack(spacing: 12) {
                        // Country selector
                        Button(action: {
                            // show country picker
                        }) {
                            HStack(spacing: 6) {
                                Image("flag")
                                    .resizable()
                                    .frame(width: 20, height: 14)
                                    .cornerRadius(2)
                                Text(countryCode)
                                    .foregroundColor(.white)
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                                    .font(.footnote)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(Color.white.opacity(0.08))
                            .cornerRadius(8)
                        }

                        // Phone TextField
                        TextField("Phone Number", text: $phone)
                            .keyboardType(.phonePad)
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.white.opacity(0.04))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 4)

                    HStack {
                        Toggle(isOn: $remember) {
                            Text("remember me")
                                .foregroundColor(.white)
                        }
                        .toggleStyle(CheckboxToggleStyle())
                        .labelsHidden() // we provide our own label
                        Spacer()

                        Button(action: {
                            // continue action
                        }) {
                            Text("Continue")
                                .fontWeight(.semibold)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 18)
                                .background(Color.white.opacity(0.12))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }

                    Divider()
                        .background(Color.white.opacity(0.2))

                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(Color.white.opacity(0.8))
                        Button(action: {
                            // sign up
                        }) {
                            Text("Sign up")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
                .padding(20)
                .background(BlurView(style: .systemUltraThinMaterialDark).opacity(0.4))
                .cornerRadius(16)
                .padding(.horizontal, 20)

                Spacer()
            }
            .padding(.vertical, 40)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice("iPhone 14 Pro")
        }
    }
}

