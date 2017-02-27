//
//  Menu.swift
//  MenuTest
//
//  Created by Stefano Frosoni on 24/02/2017.
//  Copyright © 2017 Stefano Frosoni. All rights reserved.
//

import Foundation

public enum MenuItems: String {
    case home = "Home"
    case refresh = "Refresh"
    case add = "Add"
    case user = "User"
    case album = "Album"

    func imageName() -> String {
        switch self {
        case .home:
            return "HomeMenuItem"
        case .refresh:
            return "RefreshMenuItem"
        case .add:
            return "AddMenuItem"
        case .user:
            return "UserMenuItem"
        case .album:
            return "AlbumMenuItem"
        }
    }
}


