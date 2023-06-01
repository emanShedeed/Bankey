//
//  AppDelegate.swift
//  Bankey
//
//  Created by Eman Shedeed on 22/05/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let logOutViewController = LogOutViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        window?.rootViewController = loginViewController
        
      
        logOutViewController.delegate = self
        onboardingContainerViewController.delegate = self
      

        return true
    }


}

extension AppDelegate {
    
    func setRootViewcontroller(_ vc:UIViewController, animated: Bool = true) {
        
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 0.7, options: .transitionCrossDissolve, animations: nil)
        
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    
    func didLogin() {
        if LocalState.hasOnboarderd {
            setRootViewcontroller(logOutViewController)
        }
        else{
            setRootViewcontroller(onboardingContainerViewController)
        }
    }

}
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarderd = true
        setRootViewcontroller(logOutViewController)
    }
 
}

extension AppDelegate: LogOutViewControllerDelegate {
    func didLogOut() {
        setRootViewcontroller(loginViewController)
    }
    
    
}
