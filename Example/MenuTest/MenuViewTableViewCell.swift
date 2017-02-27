//
//  MenuViewTableViewCell.swift
//  MenuTest
//
//  Created by Stefano Frosoni on 24/02/2017.
//  Copyright © 2017 Stefano Frosoni. All rights reserved.
//

import UIKit


class MenuViewTableViewCell: UITableViewCell {

    @IBOutlet weak fileprivate var iconImageView: UIImageView!
    @IBOutlet weak fileprivate var titleLabel: UILabel!
    @IBOutlet weak fileprivate var valueLabel: UILabel!

    static let identifier: String = "MenuViewTableViewCell"

    public var value : Int? {
        didSet {
            if let value = value {
                valueLabel.text = "\(value)"
            } else {
                 valueLabel.text = ""
            }

        }
    }

    public var menuItem: MenuItems? {
        didSet {
            guard let menuItem = menuItem else { return }
            if let image = UIImage(named: menuItem.imageName()) {
                iconImageView.image = image
            }
            titleLabel.text = menuItem.rawValue
        }
    }
}
