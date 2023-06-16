//
//  ShekyBellView.swift
//  Bankey
//
//  Created by Eman Shedeed on 15/06/2023.
//

import UIKit

class ShakeyBellView: UIView {
    
    let bellImageView = UIImageView()
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
        
    }
    
    func layout(){
        addSubview(bellImageView)
        bellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bellImageView.widthAnchor.constraint(equalToConstant: 24),
            bellImageView.heightAnchor.constraint(equalToConstant: 24),
            bellImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bellImageView.centerYAnchor.constraint(equalTo: centerYAnchor)
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
