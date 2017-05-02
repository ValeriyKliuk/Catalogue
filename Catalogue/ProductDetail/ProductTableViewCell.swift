//
//  ProductTableViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

final class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
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
    func configure(product image: String) {
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
}
