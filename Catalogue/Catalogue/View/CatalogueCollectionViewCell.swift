//
//  CatalogueCollectionViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit
import QuartzCore

final class CatalogueCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    /// configure cell
    func configure(product name: String, image: String) {
        self.productNameLabel.text = name
        DispatchQueue.global(qos: .background).async { [weak self]() -> Void in
            let image = UIImage(named: image)
            DispatchQueue.main.async {
                () -> Void in
                if let image = image {
                    self?.productImageView?.image = image
                }
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.containerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.containerView.layer.cornerRadius = 6.0
        self.containerView.layer.shadowRadius = 1.0
        self.containerView.layer.shadowOpacity = 0.4
        self.containerView.layer.shadowPath = UIBezierPath(roundedRect: self.containerView.layer.bounds, cornerRadius: 6.0).cgPath
    }

}
