//
//  WishListTableViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

final class WishListTableViewCell: ColoursTableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    @IBOutlet weak var baseView: UIView!
    
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
    func configure(product name: String, price: Int, description: String, image: String, colors: [ProductColor]?) {
        self.productNameLabel.text = name
        self.productDescription.text = description
        self.productPriceLabel.text = "$ \(price)"
        DispatchQueue.global(qos: .background).async { [weak self]() -> Void in
            let image = UIImage(named: image)
            DispatchQueue.main.async {
                () -> Void in
                if let image = image {
                    self?.productImageView?.image = image
                }
            }
        }
        
        if let colors = colors {
            self.colors = colors
        }
    }

}
