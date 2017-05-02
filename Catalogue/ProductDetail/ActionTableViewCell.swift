//
//  ActionTableViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

final class ActionTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var buttonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.baseView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.baseView.layer.shadowColor = UIColor.lightGray.cgColor
        self.baseView.layer.cornerRadius = 6.0
        self.baseView.layer.shadowRadius = 2.0
        self.baseView.layer.shadowOpacity = 0.4
        self.baseView.layer.shadowPath = UIBezierPath(roundedRect: self.baseView.layer.bounds, cornerRadius: 6.0).cgPath
    }
    
    // MARK: - Configure cell
    
    /// configure cell
    func configure(buttonLabel text: String, buttonColor color: UIColor) {
        self.buttonLabel.text = text
        self.baseView.backgroundColor = color
    }
}
