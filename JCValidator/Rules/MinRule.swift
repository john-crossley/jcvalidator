//
//  MinRule.swift
//  JCValidator
//
//  Created by John Crossley on 10/02/2018.
//  Copyright © 2018 John Crossley. All rights reserved.
//

import Foundation

class MinRule: Rule {

    private let min: Int
    private let name: String

    init(min: Int, name: String) {
        self.min = min
        self.name = name
    }

    init(min: Int) {
        self.min = min
        self.name = "field"
    }

    func validate(_ text: String?) -> (isValid: Bool, message: String?) {
        guard let text = text else { return (false, "You must enter a value") }

        if text.count < min {
            return (false, "The \(name) field is too short, min is \(min)")
        }
        return (true, nil)
    }
}
