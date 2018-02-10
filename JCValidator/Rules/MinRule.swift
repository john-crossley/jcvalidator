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

    func validate(_ text: String?) -> Result {
        guard let text = text else {
            return Result(isValid: false, message: "You must enter a value")
        }

        if text.count < min {
            return Result(isValid: false, message: "The \(name) field is too short, min is \(min)")
        }

        return Result(isValid: true, message: "")
    }
}
