//
//  BlurView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 17.09.25.
//

import SwiftUI

// Blur wrapper to get a translucent card look
struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(style: .dark)
    }
}
