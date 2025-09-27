//
//  CountryPickerView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 17.09.25.
//

import SwiftUI

struct CountryPickerView: View {
    @Environment(\.presentationMode) var presentationMode

//    @Binding var selected: Country?
    @ObservedObject var viewModel: LoginViewModel
    @State private var searchText: String = ""
    @State private var countries: [Country] = []

    var body: some View {
        NavigationView {
            List {
                // Search bar
                if !searchText.isEmpty {
                    // nothing — search field is in nav bar
                }

                ForEach(filteredCountries) { country in
                    Button(action: {
//                        selected = country
                        viewModel.selectCountry(country)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Text(country.flag)
                                .font(.system(size: 28))
                                .frame(width: 40)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(country.name)
                                    .font(.body)
                                Text(country.dialCode)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            if viewModel.selectedCountry == country {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .padding(.vertical, 6)
                    }
                }
            }
            .navigationTitle("Select country")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { presentationMode.wrappedValue.dismiss() }
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(systemName: "globe")
                        Text("Country")
                            .font(.headline)
                    }
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search country or code")
            .onAppear(perform: loadCountries)
        }
    }

    private var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        }
        return countries.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.dialCode.localizedCaseInsensitiveContains(searchText) ||
            $0.code.localizedCaseInsensitiveContains(searchText)
        }
    }

    private func loadCountries() {
        if !countries.isEmpty { return }
        // Load from bundle countries.json
        if let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let list = try? JSONDecoder().decode([Country].self, from: data) {
            countries = list.sorted { $0.name < $1.name }
            return
        }

        // Fallback inline list
        countries = [
            Country(name: "Egypt", code: "EG", dialCode: "+20"),
            Country(name: "United States", code: "US", dialCode: "+1"),
            Country(name: "United Kingdom", code: "GB", dialCode: "+44"),
            Country(name: "Saudi Arabia", code: "SA", dialCode: "+966"),
            Country(name: "United Arab Emirates", code: "AE", dialCode: "+971")
        ]
    }
}

struct CountryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        CountryPickerView(viewModel: LoginViewModel())
    }
}
