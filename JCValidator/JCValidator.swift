//
//  JCValidator.swift
//  JCValidator
//
//  Created by John Crossley on 03/02/2018.
//  Copyright © 2018 John Crossley. All rights reserved.
//

import UIKit

internal class WeakRef<T>: Hashable where T: AnyObject, T: Hashable {
    private(set) weak var value: T?

    var hashValue: Int {
        return self.value!.hashValue
    }

    init(value: T?) {
        self.value = value
    }

    static func == (lhs: WeakRef<T>, rhs: WeakRef<T>) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
}

protocol JCValidatorDelegate: class {
    func didValidate(textField: UITextField, state: JCValidator.State)
}

class JCValidator: NSObject {
    typealias RuleSet = [WeakRef<UITextField>: [Rule]]
    fileprivate var rules = RuleSet()

    weak var delegate: JCValidatorDelegate?

    enum State {
        case valid
        case errors([String])
    }

    //    static let shared = JCValidator()

    func bind(rules: [Rule], to textField: UITextField) {
        self.rules.updateValue(rules, forKey: WeakRef(value: textField))
        textField.delegate = self
    }

    func bind(rule: Rule, to textField: UITextField) {
        self.bind(rules: [rule], to: textField)
    }

    private func rules(for textField: UITextField) -> [Rule] {
        let rules = self.rules.first { (key, value) -> Bool in
            if key.value == textField {
                return true
            }
            return false
        }

        return rules?.value ?? []
    }

    func isValid(_ text: String?) -> Bool {
        return true
    }
}

extension JCValidator: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let rules = self.rules(for: textField)
        let results = rules.map { rule in return rule.validate(textField.text) }

        print(results)

        return true
    }
}
