//
//  Login_View.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 25.09.25.
//

import SwiftUI

struct Login_View: View {
    @State private var phoneNumber: String = ""
    @State private var selectedCountry: Country? = Country(name: "Egypt", code: "EG", dialCode: "+20")
    @State private var showCountryPicker = false

    var body: some View {
        VStack(spacing: 16) {
            // Country + phone input
            HStack {
                Button(action: { showCountryPicker.toggle() }) {
                    HStack {
                        Text(selectedCountry?.flag ?? "🌐")
                        Text(selectedCountry?.dialCode ?? "+20")
                            .font(.body)
                        Image(systemName: "chevron.down")
                            .font(.caption)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 10)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                }

                TextField("Phone number", text: $phoneNumber)
                    .keyboardType(.phonePad)
                    .padding(12)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
            }
            .padding()

            Button("Continue") {
                // call API /login with phone, udid, otp flow...
            }
            .buttonStyle(.borderedProminent)
            .padding(.horizontal)
        }
        .sheet(isPresented: $showCountryPicker) {
            CountryPickerView( viewModel: LoginViewModel())
        }
    }
}

struct Login_View_Previews: PreviewProvider {
    static var previews: some View {
        Login_View()
    }
}
