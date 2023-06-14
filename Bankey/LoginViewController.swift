//
//  ViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 22/05/2023.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {
    
    // MARK: Property
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    //MARK: Constants
    weak var delegate: LoginViewControllerDelegate?
    
    private let leadingEdgeOnScreen: CGFloat = 16
    private let leadingEdgeOffScreen: CGFloat = -1000
    private var titleLeadingAnchor: NSLayoutConstraint?
    private var subTitleLeadingAnchor: NSLayoutConstraint?
    
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
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
    
}

private extension LoginViewController{
    
    func style(){
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        titleLabel.alpha = 0
        
        subtitleLabel.text = "Your Premium Source for all things banking"
        subtitleLabel.numberOfLines = 2
        subtitleLabel.textAlignment = .center
        subtitleLabel.alpha = 0
        
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
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1)
        ])
        
        titleLeadingAnchor = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        titleLeadingAnchor?.isActive = true
        
        //subtitleLabel
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: subtitleLabel.trailingAnchor, multiplier: 1)
        ])
        subTitleLeadingAnchor =  subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingEdgeOffScreen)
        subTitleLeadingAnchor?.isActive = true
        
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
            delegate?.didLogin()
        }
        
    }
    
    func configureLabel(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
        shakeSignInButton()
    }

}

// MARK: Animations
private extension LoginViewController {
    
    func shakeSignInButton(){
        let shakeAnimaton = CAKeyframeAnimation()
        shakeAnimaton.keyPath = "position.x"
        shakeAnimaton.values = [0, 10, -10, 0]
        shakeAnimaton.keyTimes = [0, 0.16, 0.5, 0.85 , 1]
        shakeAnimaton.duration = 0.8
        shakeAnimaton.isAdditive = true
        
        signInButton.layer.add(shakeAnimaton, forKey: "shake")
    }
    
    func animate(){
        let duration = 0.75
        let labelAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut){ [weak self] in
            guard let self  else { return }
            self.titleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()
        }
        labelAnimator.startAnimation()
        
        //subtitleLabelAnimator
        let subTitlelabelAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeInOut){ [weak self] in
            guard let self  else { return }
            self.subTitleLeadingAnchor?.constant = self.leadingEdgeOnScreen
            self.view.layoutIfNeeded()

        }
        subTitlelabelAnimator.startAnimation(afterDelay: 1)
        //fadeAnimator
        let fadeAnimator = UIViewPropertyAnimator(duration: duration * 2, curve: .easeInOut){ [weak self] in
            
            guard let self  else { return }
            self.titleLabel.alpha = 1
            self.subtitleLabel.alpha = 1
            self.view.layoutIfNeeded()
        }
        fadeAnimator.startAnimation(afterDelay: 1)
       
    }
}

// MARK: Actions
extension LoginViewController {
    @objc func SignInButtonTapped(){
        errorMessageLabel.isHidden = true
        login()
   
    }
    
}

