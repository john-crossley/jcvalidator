//
//  Rule.swift
//  JCValidator
//
//  Created by John Crossley on 10/02/2018.
//  Copyright © 2018 John Crossley. All rights reserved.
//

import Foundation

internal struct Result {
    let isValid: Bool
    let message: String
}

protocol Rule: class {
    func validate(_ text: String?) -> Result
}
