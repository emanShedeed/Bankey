//
//  FirstOnboardingViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 29/05/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let closeButton = UIButton(type:.system)
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let infoLabel = UILabel()
    
    let nextButton = UIButton(type:.system)
    
    let infoMessage: String
    let imageName: String
    
    init(imageName: String, infoMessage: String ) {
        self.imageName = imageName
        self.infoMessage = infoMessage
        
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        style()
        layout()
        view.backgroundColor = .systemBackground
    }
    
}
private extension OnboardingViewController{
    
    func style() {
        
        closeButton.setTitle("Close", for: [])
        nextButton.setTitle("Next", for: [])
  
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.text = infoMessage
        
    }
    
    func layout(){
        
        view.addSubview(closeButton)
        view.addSubview(stackView)
        view.addSubview(nextButton)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(infoLabel)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        //closeButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1)
        ])
        
        //stackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
            //stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //nextButton
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 1),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 1)
        ])
        
    }
}
