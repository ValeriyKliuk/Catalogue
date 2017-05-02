//
//  ProductRateTableViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

final class ProductRateTableViewCell: UITableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    // MARK: - Configure cell
    
    /// configure cell
    func configure(rating value: Int) {
        self.ratingControl.rating = value
    }
    
}
