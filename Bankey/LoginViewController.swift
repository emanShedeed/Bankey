//
//  ViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 22/05/2023.
//

import UIKit


class LoginViewController: UIViewController {
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var isDataEmpty : Bool {
        if loginView.userNameTextField.text == "" || loginView.passwordTextField.text == "" {
            return true
        }else{
            return false
        }
    }
    
    var isCorrectLoginData : Bool {
        if loginView.userNameTextField.text == "Eman"  && loginView.passwordTextField.text == "123456" {
            return true
        }else{
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }
    
    
}

private extension LoginViewController{
    
    func style(){
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        subtitleLabel.text = "Your Premium Source for all things banking"
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        
        //signInButton
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(SignInButtonTapped), for: .primaryActionTriggered)
        
        //error message
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
    }
    
    func layout(){
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        loginView.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
     
        
        //titleLabel
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1)
        ])
        
        //subtitleLabel
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 1)
        ])
        
        //loginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -8),
        ])
        // signInButton
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 1)
        ])
        // errorMessageLabel
        
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorMessageLabel.trailingAnchor, multiplier: 1)
        ])
        
    }
    func login(){
        if isDataEmpty{
            configureLabel(withMessage: "username / Password cannot be blank")
            return
        }
        
        if !isCorrectLoginData {
            configureLabel(withMessage: "incorrect UserName / Password")
        }else{
            signInButton.configuration?.showsActivityIndicator = true
        }
        
    }
    func configureLabel(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
// MARK: Actions
extension LoginViewController {
    @objc func SignInButtonTapped(){
        errorMessageLabel.isHidden = true
      login()
    }
    
}

