//
//  ColoursTableViewCell.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-05-01.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

class ColoursTableViewCell: UITableViewCell, UICollectionViewDataSource {

    /// Colours
    var colors: [ProductColor] = []
    
    // MARK - UIColor Conversion
    func convert(productColor color: ProductColor) -> UIColor? {
        switch color {
        case .brown:
            return UIColor(red: 166.0/255.0, green: 95.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        case .blue:
            return UIColor(red: 31.0/255.0, green: 40.0/255.0, blue: 58.0/255.0, alpha: 1.0)
        case .green:
            return UIColor(red: 201.0/255.0, green: 200.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        case .orange:
            return UIColor(red: 246.0/255.0, green: 159.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        let color = colors[indexPath.row]
        cell.backgroundColor = self.convert(productColor: color)
        return cell
    }


}
