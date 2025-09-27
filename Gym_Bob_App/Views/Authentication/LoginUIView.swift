//
//  LoginUIView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 15.09.25.
//

import SwiftUI

struct LoginUIView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        // Background image
//        ZStack{
//            
//    //            .frame(maxWidth: .infinity, maxHeight: .infinity)
//    //                .clipped() // prevents overflow outside frame
////            Color.black.opacity(0.6) // overlay
////                    .ignoresSafeArea()
//        }
        

        ZStack {
            
            Image("gym_background")
                .resizable()
    //            .aspectRatio(contentMode: .fill)
                .scaledToFill()
                .frame(width: 400, height: 850) // your target size
                    .clipped()
                .ignoresSafeArea()
            // Black overlay
            Color.black.opacity(0.6)
                .ignoresSafeArea()

            // Main content
            VStack(spacing: 0) {
                // Top bar
                HStack {
//                    Text("bhhg").foregroundColor(.orange)
                    Spacer()
                    Button(action: {
                        viewModel.currentStep = .dashboard
                    }) {
                        Text("Visitor")
                            .foregroundColor(Color.orange)
                            .font(.system(size: 14, weight: .bold))
                    }
                }
                .padding(.horizontal, 30)
                .padding(.top, 30)

                Spacer()

                // Title
                Text("BOP GYMBA")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 16)
                
                Spacer()


//                ExistingUserLoginView(viewModel: LoginViewModel()).frame(maxWidth: .infinity, minHeight: 320, maxHeight: 400)
//                    .cornerRadius(16)
//                    .padding(.horizontal, 30)
                // Flow container
                LoginFlowView()
//                ClearBackgroundPages()
                    .frame(maxWidth: .infinity, minHeight: 320, maxHeight: 400)
//                    .background(Color.black)
//                padding(5)
                    .background(Color(hex: "#1F2020", opacity: 0.5)
                        .ignoresSafeArea())  // background of this tab
                    .cornerRadius(16)
                    
                    .padding(.horizontal, 30)

                Spacer().frame(height: 50)
            }
            .padding(.vertical, 30)
        }
    }
}


struct LoginUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoginUIView()
    }
}
