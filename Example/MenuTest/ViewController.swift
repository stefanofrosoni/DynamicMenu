//
//  ViewController.swift
//  MenuTest
//
//  Created by Stefano Frosoni on 24/02/2017.
//  Copyright © 2017 Stefano Frosoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak fileprivate var menuView: MenuView!
    var arrayMenuItems: [MenuItems] = []
    var value : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        menuView.menuViewDelegate = self
        arrayMenuItems = [MenuItems.home, MenuItems.home, MenuItems.refresh, MenuItems.album, MenuItems.user, MenuItems.add]
        menuView.menuItemsData = arrayMenuItems
    }

}

extension ViewController: MenuViewDelegate {

    func didSelect(_ menuItems: MenuItems) {
        print(menuItems.rawValue)
        menuView.updateValue(value: value, for: menuItems)
        value += 1

        menuView.menuItemsData.append(MenuItems.home)
    }
}

