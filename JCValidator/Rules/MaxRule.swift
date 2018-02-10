//
//  MaxRule.swift
//  JCValidator
//
//  Created by John Crossley on 10/02/2018.
//  Copyright © 2018 John Crossley. All rights reserved.
//

import Foundation

class MaxRule: Rule {

    private let max: Int
    private let name: String

    init(max: Int, name: String) {
        self.max = max
        self.name = name
    }

    init(max: Int) {
        self.max = max
        self.name = "field"
    }

    func validate(_ text: String?) -> Result {

        guard let text = text else {
            return Result(isValid: false, message: "You must enter a value")
        }

        if text.count > max {
            return Result(isValid: false, message: "The \(name) field is too long, max is \(max)")
        }

        return Result(isValid: true, message: "")
    }
}
