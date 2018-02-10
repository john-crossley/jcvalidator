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
        validator.bind(rules: [MinRule(min: 3), MaxRule(max: 100)], to: nameTextField)
        validator.bind(rule: EmailRule(), to: emailTextField)
        validator.bind(rule: MinRule(min: 6), to: passwordTextField)
    }

}

extension ViewController: JCValidatorDelegate {
    func didValidate(textField: UITextField, state: JCValidator.State) {
        switch state {
        case .valid:
            print("\(String(describing: textField.text)) is valid")
            updateLabel(for: textField)
        case .error(let message):

            updateErrorLabel(for: textField, with: message.first)

        }
    }

    fileprivate func updateErrorLabel(for textField: UITextField, with message: String?) {
        switch textField {
        case nameTextField:
            nameLabel.textColor = .red
            nameLabel.text = message
        case emailTextField:
            emailLabel.textColor = .red
            emailLabel.text = message
        case passwordTextField:
            passwordLabel.textColor = .red
            passwordLabel.text = message
        default: break
        }
    }

    fileprivate func updateLabel(for textField: UITextField) {
        switch textField {
        case nameTextField:
            nameLabel.textColor = .black
            nameLabel.text = "Full name"
        case emailTextField:
            emailLabel.textColor = .black
            emailLabel.text = "Email address"
        case passwordTextField:
            passwordLabel.textColor = .black
            passwordLabel.text = "Password"
        default: break
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

