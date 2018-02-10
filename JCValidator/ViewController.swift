//
//  ViewController.swift
//  JCValidator
//
//  Created by John Crossley on 03/02/2018.
//  Copyright © 2018 John Crossley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet var textFields: [UITextField]!

    private let validator = JCValidator()

    override func viewDidLoad() {
        super.viewDidLoad()

        validator.delegate = self

        validator.bind(rules: [MinRule(min: 0), MaxRule(max: 100)], to: nameTextField)
        validator.bind(rule: MinRule(min: 6), to: passwordTextField)

//        textFields.forEach { $0.delegate = self }
    }

}

extension ViewController: JCValidatorDelegate {
    func didValidate(textField: UITextField, state: JCValidator.State) {
        switch state {
        case .valid:
            print("\(String(describing: textField.text)) is valid")
        case .errors(_):
            print("\(String(describing: textField.text)) is not valid")
        }
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField {
//        case nameTextField: print("nameTextField isValid=\(nameTextField.isValid())")
//        case emailTextField: print("emailTextField isValid=\(emailTextField.isValid())")
//        case passwordTextField: print("passwordTextField isValid=\(passwordTextField.isValid())")
//        default: break
//        }
//
//        return true
//    }
//}

