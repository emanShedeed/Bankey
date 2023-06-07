//
//  SummaryTableViewHeader.swift
//  Bankey
//
//  Created by Eman Shedeed on 07/06/2023.
//

import UIKit

class SummaryTableViewHeader: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: 144)
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed(String(describing:type(of: self)), owner: self)
        
    }
}
private extension SummaryTableViewHeader{
    
    func style(){
        contentView.backgroundColor = UIColor.appColor(.mainColor)
    }
    
    func layout(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

