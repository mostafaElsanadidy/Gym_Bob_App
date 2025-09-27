//
//  PhoneLoginView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 17.09.25.
//

import SwiftUI

struct PhoneLoginView: View {
    
    @StateObject private var viewModel = LoginViewModel()
//    @State private var phone = ""
    @FocusState private var isPhoneFocused: Bool
    
    var body: some View {
        VStack(spacing: 25) {
                
            Text("Enter Your Phone")
                .font(.title)
                .bold().foregroundColor(.white)
            HStack{
                Button(action: {
                    // Perform login
                    guard viewModel.isVerifiedPhoneNumber else{
                        viewModel.currentStep = .code
                        return
                    }
                    let udid = NetworkHelper.getDeviceUDID()
                    let correctUDID = "sdfsdfsd-sdfsdfs-fdfds-23432sdf-sfdsd"
                    let correctPhoneNumber = "01211090887"
                    
                    if viewModel.phoneNumber == correctPhoneNumber{
                        if udid == correctUDID {
                            //go to dashboard
                            viewModel.currentStep = .dashboard
                        }else{
                            viewModel.errorMessage = "this is a new device. want you continue? yes or no"
                            viewModel.currentStep = .password
                            //Then : Do you want to add this new device to your account ?
                        }
                        }else{
                            viewModel.errorMessage = "this is a new phone number. want you continue? yes or no"
                            viewModel.currentStep = .password
                            //Then Go To terms & conditions
                        }
                    
                    
                }) {
                    Image(systemName:"arrowtriangle.backward.fill")
                        .frame(width:25.0,height: 25.0)
                    
                        .padding()
                        .background(Color.orange.opacity(1))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .font(.headline)
                }
                .padding(.top,5)
                VStack(spacing:2)
                 {
                    HStack{
                        
                        Button(action: {
                            viewModel.toggleCountryPicker()
//                            viewModel.showCountryPicker = true
                        }) {
                            HStack {
                                Text(viewModel.selectedCountry?.flag ?? "🌐")
                                Text(viewModel.selectedCountry?.dialCode ?? "+20").foregroundColor(.white)
                            }
                            .padding(8)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
//                            .background(
//                                                                        RoundedRectangle(cornerRadius: 10)
//                                                                            .stroke( Color.clear, lineWidth: 2))
                        Color.white.frame(width:1,height: 40)
                        
//                        ZStack(alignment:.leading){
////                            Text("Phone Number").foregroundColor(.white.opacity(0.5)).padding(.leading, 10.0)
//
//                            if !isPhoneFocused && viewModel.phoneNumber.isEmpty {
//                                            Text("Phone Number")
//                                                .foregroundColor(.white.opacity(0.5))
//                                                .padding(.leading, 14)
//                                        }
//                        TextField("", text: $viewModel.phoneNumber)
//                    .keyboardType(.phonePad)
//                    .autocapitalization(.none)
//                    .padding()
//                    .foregroundColor(.white)
//                    .cornerRadius(8)
//                    .focused($isPhoneFocused) // 👈 track focus
//                    .onChange(of: viewModel.phoneNumber) { _ in
//                                viewModel.validatePhone()
//                            }}
                        
                        FloatingPhoneField()
                        
                    }
                    Color.white.frame(height:1).padding(.horizontal,5)
                     
                     if let error = viewModel.phoneError {
                                     Text(error).foregroundColor(.red).font(.caption)
                                 }
                }
                
            }
//                .background(
//                    RoundedRectangle(cornerRadius: 10)
//                        .stroke( Color.white, lineWidth: 2))
//

//            VStack(spacing: 5)
//            {
//                HStack {
//                    Group {
//                        if isPasswordVisible {
//                            TextField("Password", text: $viewModel.password)
//                        } else {
//                            SecureField("Password", text: $viewModel.password)
//                        }
//                    }
//                    .padding()
//                    .foregroundColor(.white)
//
//
//
//                    Button(action: {
////                        isPasswordVisible.toggle()
//                    }) {
////                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
//                        Image(systemName: "eye.slash.fill")
//                            .foregroundColor(.white)
//                    }
//                    .padding(.horizontal, 8)
//                }.cornerRadius(8)
//                Color.white.frame(height:2).padding(.horizontal,10)
//        }

//            Button(action: {
//                // Perform login
//            }) {
//                Text("LOG IN")
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.red)
//                    .foregroundColor(.white)
//                    .cornerRadius(16)
//                    .font(.headline)
//            }
//            .padding(.top)

            Button(action: {
//                isPasswordVisible.toggle()
            }) {
                Image("QRCode Scanner")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .frame(width:60,height: 60)
                    .foregroundColor(Color.white.opacity(0.8))
            }

//                            VStack(spacing: 12) {
//                                Text("LOG IN AS:")
//                                    .foregroundColor(.white)
//                                    .font(.subheadline)
//
//                                HStack(spacing: 20) {
//                                    ForEach(roles, id: \.self) { role in
//                                        VStack {
//                                            Image(systemName: iconName(for: role))
//                                                .font(.system(size: 24))
//                                                .foregroundColor(.white)
//
//                                            Text(role.uppercased())
//                                                .font(.caption)
//                                                .foregroundColor(.white)
//                                        }
//                                        .padding()
//                                        .background(
//                                            RoundedRectangle(cornerRadius: 8)
//                                                .stroke(viewModel.selectedRole.rawValue == role ? Color.red : Color.white, lineWidth: viewModel.selectedRole.rawValue == role ? 2 : 1)
//                                        )
//                                        .onTapGesture {
//                                            if let userRole = UserRole(rawValue:role){
//                                                viewModel.selectedRole = userRole}
//                                        }
//                                    }
//                                }
//                            }

//                            Spacer()

            // Alternate styling (gray and uppercase)
//                            HStack {
//
//                                Button(action: {
//                                    viewModel.rememberMe.toggle()
//                                }) {
//                                    HStack {
//                                        Image(systemName: viewModel.rememberMe ? "checkmark.square" : "square")
//                                            .foregroundColor(.white)
//                                        Text("Remember Me")
//                                            .foregroundColor(.white)
//                                    }
//                                }
//
//                                Spacer()
//
//                                Button(action: {
//    //                                viewModel.onForgotPassword()
//                                }) {
//                                    Text("FORGOT PASSWORD?")
//                                        .font(.system(size: 12))
//                                        .foregroundColor(.gray)
//                                }
//                            }
//                            Spacer().frame(height:1)
            VStack(spacing:10){
                Text("Don’t have an account ?")
                    .foregroundColor(.white)
                Text("Sign up")
                    .foregroundColor(.white)
            }
            
//            PageControl(numberOfPages: 3, currentPage: 2)

        }
        .sheet(isPresented: $viewModel.showCountryPicker) {
                    CountryPickerView(viewModel: viewModel)
                }
//                .padding()
    }
    
}

struct PhoneLoginView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneLoginView()
    }
}
