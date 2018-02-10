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

    func validate(_ text: String?) -> (isValid: Bool, message: String?) {

        guard let text = text else { return (false, "You must enter a value") }

        if text.count > max {
            return (false, "The \(name) field is too long, max is \(max)")
        }
        return (true, nil)
    }
}
