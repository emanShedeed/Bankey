//
//  FirstOnboardingViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 29/05/2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let stackView = UIStackView()
    let imageView = UIImageView()
    let infoLabel = UILabel()
    
    
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
        
      
      
  
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        
        stackView.axis = .vertical
        stackView.spacing = 20
        
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        infoLabel.text = infoMessage
        
    }
    
    func layout(){
        
       
        view.addSubview(stackView)
     
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(infoLabel)
        
      
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
      
        
        //stackView
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
            //stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
      
        
    }
}
