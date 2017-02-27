//
//  MenuView.swift
//
//  Created by Stefano Frosoni on 24/02/2017.
//  Copyright © 2017 Stefano Frosoni. All rights reserved.
//

import UIKit

public protocol MenuViewDelegate: class {
    func didSelect(_ menuItems: MenuItems)
}

public class MenuView: UIView {

    @IBOutlet weak fileprivate var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: MenuViewTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MenuViewTableViewCell.identifier)
            tableView.rowHeight = Constants.rowHeight
        }
    }

    public var menuItemsData: [MenuItems] = [] {
        didSet {
            menuItemsData = menuItemsData.removeDuplicates()
            tableView.reloadData()
        }
    }

    public func updateValue(value: Int, for menuItem: MenuItems) {
        if let indexOfItem = menuItemsData.index(of: menuItem) {
            let indexpath = IndexPath(row: 0, section: indexOfItem)
            guard let cell = tableView.cellForRow(at: indexpath) as? MenuViewTableViewCell else { return }
            cell.value = value

        }
    }

    weak var menuViewDelegate: MenuViewDelegate?

    fileprivate enum Constants {
        static let viewNibName = "MenuView"
        static let rowHeight: CGFloat = 50
    }

    // MARK: initialisers
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    fileprivate func setupView() {
        let view = loadViewFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        let views = ["view": view]
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: views)
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: .alignAllLastBaseline, metrics: nil, views: views)

        addConstraints(verticalConstraints + horizontalConstraints)
    }

    fileprivate func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: Constants.viewNibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}

// MARK: - UITableViewDataSource
extension MenuView: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return menuItemsData.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuViewTableViewCell.identifier) as? MenuViewTableViewCell else { return UITableViewCell() }
        cell.menuItem = menuItemsData[indexPath.section]
        return cell
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item =  menuItemsData[indexPath.section] as MenuItems
        menuViewDelegate?.didSelect(item)
    }
}

extension MenuView: UITableViewDelegate {

    // Make the background color show through
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

    // Set the spacing between sections
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (tableView.frame.size.height - (CGFloat(menuItemsData.count) * Constants.rowHeight)) / CGFloat(menuItemsData.count + 1)
    }
}





