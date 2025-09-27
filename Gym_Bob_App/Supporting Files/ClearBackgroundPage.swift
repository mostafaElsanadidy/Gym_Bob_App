//
//  ClearBackgroundPage.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 19.09.25.
//

import SwiftUI

struct ClearBackgroundPages: View {
    var body: some View {
        TabView {
            Color.clear
                .overlay(Text("Page 1").foregroundColor(.white).bold())
                .background(Color.clear) // clear page background

            Color.blue
                .overlay(Text("Page 2").foregroundColor(.white).bold())
                .background(Color.clear)

            Color.green
                .overlay(Text("Page 3").foregroundColor(.white).bold())
                .background(Color.clear)
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.clear) // whole TabView transparent
    }
}


struct ClearBackgroundPages_Previews: PreviewProvider {
    static var previews: some View {
        ClearBackgroundPages()
    }
}
