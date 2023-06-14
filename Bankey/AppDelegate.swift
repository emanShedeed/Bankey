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
    let mainViewController = MainviewController()
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        registerForNoifications()
        displayLogin()
        return true
    }
    
    func  registerForNoifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didLogOut), name: .logout, object: nil)
    }
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarderd {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
    
    private func prepMainView() {
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = UIColor.appColor(.mainColor)
    }
    
}

extension AppDelegate {
    
    func setRootViewController(_ vc:UIViewController, animated: Bool = true) {
        
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
      displayNextScreen()
    }
    
}
extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarderd = true
        prepMainView()
        setRootViewController(mainViewController)
    }
    
}

extension AppDelegate {
    @objc func didLogOut() {
        setRootViewController(loginViewController)
    }
    
    
}

