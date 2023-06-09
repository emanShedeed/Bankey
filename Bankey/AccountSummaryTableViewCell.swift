//
//  TableViewCell.swift
//  Bankey
//
//  Created by Eman Shedeed on 07/06/2023.
//

import UIKit

class AccountSummaryTableViewCell: UITableViewCell {
    // MARK: Constants
    static let reuseIdentifier = "SummaryTableViewCell"
    static let cellHeight = 112.0
    
    // MARK: Outlet
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountlabel = UILabel()
    let chervonImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model:AccountSummaryModel){
        
        typeLabel.text = model.accountType.rawValue
        nameLabel.text = model.accountName
        balanceAmountlabel.attributedText = CurrencyFormatter().makeAttributedCurrency(model.balanceAmount)
        
        switch model.accountType{
            
        case .banking:
            underlineView.backgroundColor = UIColor.appColor(.mainColor)
            balanceLabel.text = "Current balance"
        case .creditCard:
            underlineView.backgroundColor = UIColor.systemOrange
            balanceLabel.text = "Current balance"
        case .investment:
            underlineView.backgroundColor = UIColor.systemPurple
            balanceLabel.text = "Value"
        }
        
        
    }
    
}
private extension AccountSummaryTableViewCell{
    
    func setup(){
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true

        
        underlineView.backgroundColor = UIColor.appColor(.mainColor)
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontForContentSizeCategory = true

        
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        

        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.textAlignment = .right
        
        balanceAmountlabel.text = "xxx.xx"
        balanceAmountlabel.textAlignment = .right
        
        chervonImageView.image = UIImage(systemName: "chevron.right")?.withTintColor(UIColor.appColor(.mainColor)!, renderingMode: .alwaysOriginal)
        
      
    }
    
    func layout(){
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(balanceStackView)
        contentView.addSubview(chervonImageView)
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountlabel)
        
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        chervonImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //typeLabel
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
        ])
        
        // underlineView
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 8),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 60),
            underlineView.heightAnchor.constraint(equalToConstant: 4)
        ])
        
        //nameLabel
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2)
        ])
        
        // stackView
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalTo: underlineView.bottomAnchor, constant: 0),
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 4)
        ])
        
        //chervonImageView
        NSLayoutConstraint.activate([
            chervonImageView.topAnchor.constraint(equalTo: balanceStackView.topAnchor, constant: 8),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: chervonImageView.trailingAnchor, multiplier: 1)
        ])
    }
    

}
