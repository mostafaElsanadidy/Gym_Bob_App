//
//  LoginFlowView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 15.09.25.
//

import SwiftUI

// MARK: - Root View
struct LoginFlowView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var selectedCountry: Country? = Country(name: "Egypt", code: "EG", dialCode: "+20")

//    init() {
//            UITabBar.appearance().backgroundColor = UIColor.black
//            UITabBar.appearance().unselectedItemTintColor = UIColor.gray
//        }
    
    var body: some View {
        TabView(selection: $viewModel.currentStep) {
//            Color.clear
//                .overlay(
            ExistingUserLoginView(viewModel: viewModel)
                .tag(LoginStep.existingUser).frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(15)
                
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
//                ).background(Color.clear) // clear page background
            
            PhoneEntryView(viewModel: viewModel)
                .tag(LoginStep.phone)
            
            CodeEntryView(viewModel: LoginViewModel())
                .tag(LoginStep.code)
                .padding(15)
            
            PasswordEntryView(onShowTerms: { "onShowTerms" }, viewModel: LoginViewModel())
                .tag(LoginStep.password)
                .padding(15)

            PasswordCreationView(viewModel: LoginViewModel())
                .tag(LoginStep.passwordCreation)
                .padding(15)
            
            PasswordSecondCreationView()
                .tag(LoginStep.passwordSecondCreation)

            TermsConditionsView(viewModel: viewModel)
                .tag(LoginStep.termsConditions)

            PhoneLoginView()
                .tag(LoginStep.phoneGroup)

            CountryPickerView(viewModel: viewModel)
                .tag(LoginStep.countryPicker)

            DashboardView()
                .tag(LoginStep.dashboard)
            
        }
        .background(Color.clear) // 👈 makes TabView background transparent

//            .background(Color.black.ignoresSafeArea()) // works for the whole TabView area
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // disables swipe dots
        .animation(.easeInOut, value: viewModel.currentStep) // smooth transition
    }
}



struct LoginFlowView_Previews: PreviewProvider {
    static var previews: some View {
        LoginFlowView()
    }
}
