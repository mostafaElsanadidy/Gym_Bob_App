//
//  PhoneEntryView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 12.09.25.
//

import SwiftUI

struct PhoneEntryView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State private var phone = ""
    @State private var rememberMe = false
    var body: some View {
        VStack {
            Text("Gym Bob")
                .font(.largeTitle)
                .foregroundColor(.white)

            Toggle("Remember Me", isOn: $rememberMe)
                .foregroundColor(.white)
                .padding()

            Button(action: {
                // Navigate to PasswordView
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button("Don’t have an account? Sign up") {
                // Sign up flow
            }
            .foregroundColor(.white)
            
            VStack {
                Text("Phone Login")
                Button("Next") {
                    viewModel.currentStep = .existingUser
                }
                Text("Enter Your Phone")
                HStack{
                    TextField("+20 Phone Number", text: $phone)
                    Color.white.frame(width:2)
    //                Button {
    //                    print("")
    //                } label: {
    //                    HStack{
    //                        Text("+966")
    //
    //                    }
    //                }

                }
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
        }
//        .padding()
//        .background(Color.black.ignoresSafeArea())
    }
}


struct PhoneEntryView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneEntryView(viewModel: LoginViewModel())
    }
}

