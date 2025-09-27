//
//  Country.swift
//  Gym_Bob_App
//
//  Created by mostafa elsanadidy on 15.09.25.
//

import Foundation

struct Country: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let code: String     // ISO alpha-2, e.g. "EG", "US"
    let dialCode: String // e.g. "+20", "+1"
    var flag: String {
        // Convert ISO code to emoji flag
        let base : UInt32 = 127397
        var s = ""
        for v in code.uppercased().unicodeScalars {
            if let scalar = UnicodeScalar(base + v.value) {
                s.unicodeScalars.append(scalar)
            }
        }
        return s
    }
   
    static let defaultCountry = Country(name: "Egypt", code: "EG", dialCode: "+20")
//flag: "🇪🇬"
}
