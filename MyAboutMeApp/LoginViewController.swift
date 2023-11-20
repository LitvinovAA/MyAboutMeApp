//
//  ViewController.swift
//  MyAboutMeApp
//
//  Created by Alexey on 17.11.2023.
//

import UIKit

final class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let user = "userA"
    private let password = "1qazXSW@"
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard userNameTextField.text == user, passwordTextField.text == password else {
            showAlert(
                withTitle: "Invalid login or password",
                andMessage: "Pleae, enter correct login and password"
            )
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.greeting = user
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func forgotButtonTapped(_ sender: UIButton) {
        sender.tag == 11
            ? showAlert(
                withTitle: "Oops!",
                andMessage: "Your name is \(user)😉"
            )
            : showAlert(
                withTitle: "Oops!",
                andMessage: "Your password is \(password)😉"
            )
        }
        
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
        userNameTextField.text = ""
    }
    
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

