//
//  FloatingPhoneField.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 22.09.25.
//

import SwiftUI

struct FloatingPhoneField: View {
    @StateObject private var viewModel = LoginViewModel()
    @FocusState private var isPhoneFocused: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            Text("Phone Number")
                .foregroundColor(isPhoneFocused || !viewModel.phoneNumber.isEmpty ? .brickRed : .white.opacity(0.5))
                .offset(y: (isPhoneFocused || !viewModel.phoneNumber.isEmpty) ? -20 : 0)
                .scaleEffect((isPhoneFocused || !viewModel.phoneNumber.isEmpty) ? 0.8 : 1.0, anchor: .leading)
                .padding(.leading, 14)
                .animation(.easeInOut(duration: 0.2), value: isPhoneFocused || !viewModel.phoneNumber.isEmpty)

            TextField("", text: $viewModel.phoneNumber)
                .keyboardType(.phonePad)
                .autocapitalization(.none)
                .padding()
                .foregroundColor(.white)
                .focused($isPhoneFocused)
                .onChange(of: viewModel.phoneNumber) { _ in
                    viewModel.validatePhone()
                }
        }
        .padding(.top, 20) // space for floating label
//        .background(Color.black.opacity(0.3))
//        .cornerRadius(8)
    }
}

struct FloatingPhoneField_Previews: PreviewProvider {
    static var previews: some View {
        FloatingPhoneField()
    }
}
