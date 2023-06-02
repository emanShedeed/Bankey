//
//  tabBarViewController+Util.swift
//  Bankey
//
//  Created by Eman Shedeed on 02/06/2023.
//

import UIKit

extension UIViewController {
    
    func setTabBarItem(imageName: String, imageTitle:String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: imageTitle, image: image, tag: 0)
    }
}
