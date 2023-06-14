//
//  UITextField+SecureToggle.swift
//  Bankey
//
//  Created by Eman Shedeed on 13/06/2023.
//

//import Foundation
import UIKit
let passwordToglleButton = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle(){
        passwordToglleButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
        passwordToglleButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
        passwordToglleButton.addTarget(self, action: #selector(didTappasswordToglleButton), for: .touchUpInside)
        rightView = passwordToglleButton
        rightViewMode = .always
    }
    @objc private func didTappasswordToglleButton(_ sender:UIButton){
        isSecureTextEntry.toggle()
        sender.isSelected.toggle()
        
    }
}
