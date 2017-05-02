//
//  WhishListFooterView.swift
//  Catalogue
//
//  Created by Valeriy Kliuk on 2017-05-01.
//  Copyright © 2017 Valeriy Kliuk. All rights reserved.
//

import UIKit

protocol WhishListFooterViewDelegate: class {
    func didTapCheckOutButton()
}

class WhishListFooterView: UITableViewHeaderFooterView {
    weak var delegate: WhishListFooterViewDelegate?

    @IBAction func checkOut(_ sender: UIButton) {
        delegate?.didTapCheckOutButton()
    }
}


