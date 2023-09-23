//
//  CatalogueViewController.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-04-30.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

class CatalogueViewController: UIViewController, CatalogueViewProtocol, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate, WhishListFooterViewDelegate {

    var presenter: CataloguePresenterProtocol?
    @IBOutlet weak var catalogCollectionView: UICollectionView!
    @IBOutlet weak var wishListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLeftBarButtonItem()
        presenter?.getFreshAPIData()
        SVProgressHUD.show()
        wishListTableView.tableFooterView = UIView()
        wishListTableView.register(UINib(nibName: "WhishListFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "WhishListFooterView")

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = " "
        self.wishListTableView.reloadData()
    }
    
    /// configure left bar button
    func configureLeftBarButtonItem() {
        let titleLabel = UILabel()
        titleLabel.text = "TASCH"
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        titleLabel.sizeToFit()
        let leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - CatalogueViewProtocol
    
    func refreshAPIData() {
        print(self.presenter?.catalogueItems ?? "Empty")
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
//        TODO: add reload tableView
//        TODO: add reload collectionView
        self.catalogCollectionView.reloadData()
    }
    
    func present(error message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier {
            switch identifier {
            case "toProduct":
                if let product = sender, sender is CatalogueItem {
                    let productViewModel: ProductViewModel = ProductViewModel(product: product as! CatalogueItem)
                    let productViewController = segue.destination as! ProductViewController
                    productViewController.productViewModel = productViewModel
                }
            default:
                break
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if let catalogueQty = self.presenter?.catalogueItems.count, catalogueQty > 0 {
            return 1
        }
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let catalogueQty = self.presenter?.catalogueItems.count, catalogueQty > 0 {
            return catalogueQty
        }
        return  0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CatalogueCollectionViewCell
        if let product = self.presenter?.catalogueItems[indexPath.row] {
            cell.configure(product: product.productShortName, image: product.imageName)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = self.presenter?.catalogueItems[indexPath.row] {
            self.performSegue(withIdentifier: "toProduct", sender: product)
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        let wishListQty = WishListController.shared.wishListItems.count
        /// If we have stored Wish List
        if wishListQty > 0 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let wishListQty = WishListController.shared.wishListItems.count
        /// If we have stored Wish List
        if wishListQty > 0 {
            return wishListQty
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String!
        let product = WishListController.shared.wishListItems[indexPath.row]
        if product.quantity == 0 {
            cellIdentifier = "WishListOutOfStockCell"
        } else {
            cellIdentifier = "WishListCell"
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WishListTableViewCell
        cell.configure(product: product.productName, price: product.price, description: product.productShortDescription, image: product.imageName, colors: product.colors)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
        let product = WishListController.shared.wishListItems[indexPath.row]
        self.performSegue(withIdentifier: "toProduct", sender: product)
    }

    // MARK: - UITableViewDelegate

     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerFrame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50)
        let headerView = UIView(frame: headerFrame)

        let titleLabelFrame = CGRect(x: 16.0, y: 16.0, width: tableView.frame.size.width/2, height: 21)
        let titleLabel = UILabel(frame: titleLabelFrame)
        titleLabel.text = "Your Wish List"
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 17.0)
        titleLabel.textAlignment = .left

        headerView.addSubview(titleLabel)
        
        let totalLabelFrame = CGRect(x: tableView.frame.size.width/2, y: 16.0, width: (tableView.frame.size.width/2 - 16.0), height: 21)
        let totalLabel = UILabel(frame: totalLabelFrame)
        totalLabel.text = "$ \(WishListController.shared.total)"
        totalLabel.font = UIFont(name: "Avenir-Light", size: 17.0)
        totalLabel.textAlignment = .right

        headerView.addSubview(totalLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50  // or whatever
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "WhishListFooterView") as! WhishListFooterView
        
        headerView.delegate = self
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 175  // or whatever
    }
    
    // MARK: - WhishListFooterViewDelegate
    
    func didTapCheckOutButton() {
        let alertController = UIAlertController(title: nil, message: "Are you sure you want to proceed to check out?", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "YES", style: .destructive, handler: nil)
        let alertCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(alertCancel)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }

}
