//
//  LoginTextField.swift
//  Bankey
//
//  Created by Eman Shedeed on 22/05/2023.
//

import UIKit


class LoginView: UIView {
    
    // MARK: Properties
    private let stackView = UIStackView()
    
    let userNameTextField = UITextField()
    let passwordTextField =  UITextField()
    let dividerView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
private extension LoginView{
    
    func style() {
        
        backgroundColor = .secondarySystemBackground
        
        userNameTextField.placeholder = "User Name"
        userNameTextField.setLeftPaddingPoints(7)
        userNameTextField.delegate = self
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.setLeftPaddingPoints(7)
        passwordTextField.delegate = self
        

        dividerView.backgroundColor = .secondarySystemFill
        
  
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
        
    }
    func layout(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(lessThanOrEqualToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
     
        
    }
}
extension LoginView : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
      return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
    }

}


