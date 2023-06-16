//
//  ShekyBellView.swift
//  Bankey
//
//  Created by Eman Shedeed on 15/06/2023.
//

import UIKit

class ShakeyBellView: UIView {
    
    let bellImageView = UIImageView()
    let countButton = UIButton()
    let countButtonHeight = 16.0
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var intrinsicContentSize: CGSize{
        CGSize(width: 48, height: 48)
    }
    
}
private extension ShakeyBellView {
    
    func setup(){
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(didTapbellImageView))
        bellImageView.addGestureRecognizer(singleTap)
        bellImageView.isUserInteractionEnabled = true
    }
    
    func style() {
        bellImageView.image = UIImage(systemName: "bell.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        countButton.backgroundColor = .systemRed
        countButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        countButton.layer.cornerRadius = countButtonHeight/2
        countButton.setTitleColor(.white, for: .normal)
        countButton.setTitle("9", for: .normal)
//        countButton.clipsToBounds = true
        
    }
    
    func layout(){
        bellImageView.translatesAutoresizingMaskIntoConstraints = false
        countButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bellImageView)
        addSubview(countButton)
        
        //bellImageView
        NSLayoutConstraint.activate([
            bellImageView.widthAnchor.constraint(equalToConstant: 24),
            bellImageView.heightAnchor.constraint(equalToConstant: 24),
            bellImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bellImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            countButton.topAnchor.constraint(equalTo: bellImageView.topAnchor),
            countButton.leadingAnchor.constraint(equalTo: bellImageView.trailingAnchor, constant: -9),
            countButton.widthAnchor.constraint(equalToConstant: countButtonHeight),
            countButton.heightAnchor.constraint(equalToConstant: countButtonHeight)
        ])
        
        
    }
}

// MARK: - Actions
extension ShakeyBellView {
    @objc func didTapbellImageView(_ recognizer: UITapGestureRecognizer) {
        shakeWith(duration: 1.0, angle: .pi/8, yOffset: 0.0)
    }

    private func shakeWith(duration: Double, angle: CGFloat, yOffset: CGFloat) {
        let numberOfFrames: Double = 6
        let frameDuration = Double(1/numberOfFrames)
        
        bellImageView.setAnchorPoint(CGPoint(x: 0.5, y: yOffset))
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: [],
          animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*2,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*3,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: +angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*4,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform(rotationAngle: -angle)
            }
            UIView.addKeyframe(withRelativeStartTime: frameDuration*5,
                               relativeDuration: frameDuration) {
                self.bellImageView.transform = CGAffineTransform.identity
            }
          },
          completion: nil
        )
     
    }
}
