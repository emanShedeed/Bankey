//
//  LogOutViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 31/05/2023.
//

import UIKit

protocol LogOutViewControllerDelegate: AnyObject{
    func didLogOut()
}

class LogOutViewController: UIViewController {
    
    let welcomeLabel = UILabel()
    let logoutButton = UIButton(type: .system)
    
    let stacKView = UIStackView()

    weak var delegate: LogOutViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        style()
        layout()
    }
    

}
private extension LogOutViewController{
    
    func style() {
        welcomeLabel.text = "Welcome"
        welcomeLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        welcomeLabel.textAlignment = .center
        
        logoutButton.setTitle("LogOut", for: [])
        logoutButton.configuration = .filled()
        logoutButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        logoutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .primaryActionTriggered)
        
        stacKView.axis = .vertical
        stacKView.spacing = 20
        
        
    }
    
    func layout(){
        
        stacKView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stacKView)
        
        stacKView.addArrangedSubview(welcomeLabel)
        stacKView.addArrangedSubview(logoutButton)
        
        //stacKView
        NSLayoutConstraint.activate([
            stacKView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stacKView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
    }
}

extension LogOutViewController {
    
    @objc func logOutButtonTapped() {
        delegate?.didLogOut()
        
    }
}
