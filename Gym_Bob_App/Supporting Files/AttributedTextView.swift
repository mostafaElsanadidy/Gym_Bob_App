//
//  AttributedTextView.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 18.09.25.
//

import Foundation
import SwiftUI

struct AttributedTextView: UIViewRepresentable {
    let attributedText: NSAttributedString

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        textView.backgroundColor = .clear
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.attributedText = attributedText
    }
}
