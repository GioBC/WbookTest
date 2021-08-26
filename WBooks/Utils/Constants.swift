//
//  Constants.swift
//  WBooks
//
//  Created by Yermis Beltran on 18/08/21.
//

import Foundation

struct Constants {
    
    struct Url {
        static let BookList = "https://private-59a7d9-iostrainingapi.apiary-mock.com/books"
    }
    
    struct key {
        static let listCell = "BookListCell"
        static let wishListCell = "WishListTableViewCell"
    }
    
    struct storyBoardName {
        static let bookListViewController = "BookListViewController"
        static let bookDetailViewController = "BookDetailViewController"
        static let tabBarViewController = "TabBarViewController"
        static let wishListViewController = "WishListViewController"
        static let addNewViewController = "AddNewViewController"
        static let rentailsViewController = "RentailsViewController"
        static let settingsViewController = "SettingsViewController"
    }
    
    struct viewControllerName {
        static let bookListViewController = "BookListViewController"
        static let bookDetailViewController = "BookDetailViewController"
        static let tabBarViewController = "TabBarViewController"
        static let wishListViewController = "WishListViewController"
        static let addNewViewController = "AddNewViewController"
        static let rentailsViewController = "RentailsViewController"
        static let settingsViewController = "SettingsViewController"
    }
    
    struct tabBarTitle {
        static let bookListTitle = "Library"
        static let wishListTitle = "WishList"
        static let addNewTitle = "Add New"
        static let rentailTitle = "Rentails"
        static let settingsTitle = "Settings"
    }
    
    struct tabBarIconName {
        static let library = "ic_library.png"
        static let wishList = "ic_wishlist.png"
        static let addNew = "ic_add new.png"
        static let rentail = "ic_myrentals.png"
        static let settings = "ic_settings.png"
        static let imageAcceptOn = "ic_myrentals active"
        static let imageAcceptOff = "ic_myrentals"
    }
    
    struct Message {
        static let errorPersonalData = "Please enter personal data"
        static let errorEmail = "Please enter your email address"
        static let errorTerm = "Please accept political and treatment data"
        static let errorAge = "Please select your age"
    }
}
