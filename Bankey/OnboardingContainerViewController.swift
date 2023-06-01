//
//  OnBoardingContainerViewController.swift
//  Bankey
//
//  Created by Eman Shedeed on 29/05/2023.
//

import UIKit

protocol OnboardingContainerViewControllerDelegate: AnyObject {
    func didFinishOnboarding()
}

enum Event {
    case next
    case  back
}

class OnboardingContainerViewController: UIViewController {
    
    var pageViewController : UIPageViewController
    var pages : [UIViewController]
    var currentVC : UIViewController
    let closeButton = UIButton(type:.system)
    let backButton = UIButton(type:.system)
    let nextButton = UIButton(type:.system)
    
    weak var delegate: OnboardingContainerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setup()
        style()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        let firstOnboardingPage = OnboardingViewController(imageName: "delorean", infoMessage: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in the 80s.")
        
        let secondOnboardingPage = OnboardingViewController( imageName: "world", infoMessage: "Move your money around the world quickly and securely.")
        
        let thirdOnboardingPage = OnboardingViewController (imageName: "thumbs", infoMessage:  "Learn more at www.bankey.com.")
        
        pages = [firstOnboardingPage, secondOnboardingPage, thirdOnboardingPage]
        
        currentVC = pages.first!
   
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension OnboardingContainerViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index-1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index < pages.count - 1 else { return nil}
        currentVC = pages[index + 1]
        return pages[index + 1]
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: currentVC) ?? 0
    }
    
}


private extension OnboardingContainerViewController {
    
    func setup(){
        pageViewController.dataSource = self
        
        if let firstVC = pages.first{
            currentVC = firstVC
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: false)
        }
    }
    
    func style(){
        view.backgroundColor = .systemPurple
        
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        
        backButton.setTitle("Back", for: [])
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .primaryActionTriggered)
        backButton.isHidden = true
        styleNextButton()
    }
    
    func styleNextButton() {
        nextButton.setTitle("Next", for: [])
        nextButton.removeTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .primaryActionTriggered)
    }
    
    func layout(){
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.translatesAutoresizingMaskIntoConstraints = false
    
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
//
        view.addSubview(closeButton)
        view.addSubview(backButton)
        view.addSubview(nextButton)
        
        //pageViewController
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //closeButton
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2)
        ])
        
        //backButton
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: backButton.bottomAnchor, multiplier: 3)
        ])
        
        //nextButton
        NSLayoutConstraint.activate([
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 3)
        ])
    }
    
    func handleNextButton(index: Int){
        
        if index == pages.count - 2 {
            nextButton.setTitle("Done", for: [])
            nextButton.removeTarget(self, action: #selector(nextButtonTapped), for: .primaryActionTriggered)
            nextButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)
        }
        
    }
}

extension OnboardingContainerViewController{
    
    @objc func closeButtonTapped(){
        delegate?.didFinishOnboarding()
    }
    
    @objc func backButtonTapped(){
        if let index = pages.firstIndex(of: currentVC), index - 1 >= 0 {
            let prevoiudVC = pages[index - 1]
            currentVC = prevoiudVC
            pageViewController.setViewControllers([prevoiudVC], direction: .forward, animated: false)
            if index - 1  == 0 {
                backButton.isHidden = true
            }
            if index == pages.count -  1 {
                styleNextButton()
            }
        }
    }
    
    @objc func nextButtonTapped() {
        if let index = pages.firstIndex(of: currentVC), index < pages.count - 1 {
            let nextVC = pages[index + 1]
            currentVC = nextVC
            pageViewController.setViewControllers([nextVC], direction: .forward, animated: false)
            backButton.isHidden = false
            handleNextButton(index: index)
          
        }
    }
}
