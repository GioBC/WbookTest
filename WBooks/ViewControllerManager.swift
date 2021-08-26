//
//  ViewControllerManager.swift
//  WBooks
//
//  Created by Yermis Beltran on 18/08/21.
//

import Foundation
import UIKit

class ViewControllerManager {
    
    static func BookListViewController() -> BookListViewController {
        let storyBoardBookList: UIStoryboard = UIStoryboard(name:Constants.storyBoardName.bookListViewController, bundle: nil)
        let bookListontroller = storyBoardBookList.instantiateViewController(withIdentifier: Constants.viewControllerName.bookListViewController) as! BookListViewController
        return bookListontroller
    }
}
