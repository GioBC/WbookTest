//
//  TabBarViewController.swift
//  WBooks
//
//  Created by Yermis Beltran on 20/08/21.
//

import UIKit
import Foundation

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bookList = BookListViewController(nibName: Constants.viewControllerName.bookListViewController, bundle: nil)
        
        bookList.tabBarItem = UITabBarItem()
        bookList.tabBarItem.title = Constants.tabBarTitle.bookListTitle
        bookList.tabBarItem.image = UIImage(named: Constants.tabBarIconName.library)
        bookList.tabBarItem.tag = 0
        
        let wishList = WishListViewController(nibName: Constants.viewControllerName.wishListViewController, bundle: nil)
        
        wishList.tabBarItem = UITabBarItem()
        wishList.tabBarItem.title = Constants.tabBarTitle.wishListTitle
        wishList.tabBarItem.image = UIImage(named:  Constants.tabBarIconName.wishList)
        wishList.tabBarItem.tag = 0
        
        let addNew = AddNewViewController(nibName: Constants.viewControllerName.addNewViewController, bundle: nil)
        
        addNew.tabBarItem = UITabBarItem()
        addNew.tabBarItem.title = Constants.tabBarTitle.addNewTitle
        addNew.tabBarItem.image = UIImage(named:  Constants.tabBarIconName.addNew)
        addNew.tabBarItem.tag = 0
        
        let rentails = RentailsViewController(nibName: Constants.viewControllerName.rentailsViewController, bundle: nil)
        
        rentails.tabBarItem = UITabBarItem()
        rentails.tabBarItem.title = Constants.tabBarTitle.rentailTitle
        rentails.tabBarItem.image = UIImage(named:  Constants.tabBarIconName.rentail)
        rentails.tabBarItem.tag = 0
        
        let settings = SettingsViewController(nibName: Constants.viewControllerName.settingsViewController, bundle: nil)
        
        settings.tabBarItem = UITabBarItem()
        settings.tabBarItem.title = Constants.tabBarTitle.settingsTitle
        settings.tabBarItem.image = UIImage(named:  Constants.tabBarIconName.settings)
        settings.tabBarItem.tag = 0
        
        viewControllers = [bookList, wishList, addNew, rentails, settings]
    }
}
