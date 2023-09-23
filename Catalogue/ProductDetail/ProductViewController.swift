//
//  ProductViewController.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var productViewModel: ProductViewModel?
    
    @IBOutlet weak var productDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = productViewModel?.productName
        productDetailTableView.rowHeight = UITableView.automaticDimension
        productDetailTableView.estimatedRowHeight = 44.0
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /// If we passed a Product to the ViewController
        if productViewModel != nil {
            return 4
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductImageCell", for: indexPath) as! ProductTableViewCell
            cell.configure(product: (productViewModel?.bigImage)!)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailCell", for: indexPath) as! ProductDetailTableViewCell

            // TODO: Use View Model
            cell.configure(productPrice: (productViewModel?.productPrice)!,
                           shippingMethod: (productViewModel?.shippingMethod)!,
                           fullDescription: (productViewModel?.fullDescription)!,
                           sizeHeight: (productViewModel?.sizeHeight)!,
                           sizeWidth: (productViewModel?.sizeWidth)!,
                           sizeDepth: (productViewModel?.sizeDepth)!,
                           colors: productViewModel?.colors)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RateProductCell", for: indexPath) as! ProductRateTableViewCell
            cell.configure(rating: (productViewModel?.rating)!)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WishListActionCell", for: indexPath) as! ActionTableViewCell
            let color: UIColor = (productViewModel?.isNew == true) ? .red : .black
            let buttonLabel: String = (productViewModel?.isNew == true) ? "Add to wish list" : "Remove from wish list"
            cell.configure(buttonLabel:buttonLabel, buttonColor: color)
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            if productViewModel?.isNew == true {
                WishListController.shared.wishListItems.append((productViewModel?.getCurrentProduct())!)
            } else {
                WishListController.shared.removeFromWishList(productId: (productViewModel?.productID)!)
            }
            self.navigationController?.popToRootViewController(animated: true)
        }
    }

}
