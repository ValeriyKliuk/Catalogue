//
//  ProductDetailTableViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

final class ProductDetailTableViewCell: ColoursTableViewCell {

    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var shippingMethodLabel: UILabel!
    @IBOutlet weak var fullDescriptionLabel: UILabel!
    
    @IBOutlet weak var colorsCollectionView:     UICollectionView!

    @IBOutlet weak var sizeHeightLabel: UILabel!
    @IBOutlet weak var sizeWidthLabel: UILabel!
    @IBOutlet weak var sizeDepthLabel: UILabel!
    
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
    func configure(productPrice price: String, shippingMethod: String, fullDescription: String, sizeHeight: String, sizeWidth: String, sizeDepth: String, colors: [ProductColor]?) {
        self.productPriceLabel.text = price
        self.shippingMethodLabel.text = shippingMethod
        self.fullDescriptionLabel.text = fullDescription
        self.sizeHeightLabel.text = sizeHeight
        self.sizeWidthLabel.text = sizeWidth
        self.sizeDepthLabel.text = sizeDepth
        if let colors = colors {
            self.colors = colors
        }
    }

}
