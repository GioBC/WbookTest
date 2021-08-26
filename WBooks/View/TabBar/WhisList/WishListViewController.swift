//
//  WishListViewController.swift
//  WBooks
//
//  Created by Yermis Beltran on 20/08/21.
//

import UIKit
import RxSwift
import PKHUD

class WishListViewController: UIViewController {

    @IBOutlet weak var wishListTable: UITableView!
    
    var viewModel: BookViewModel = BookViewModel(respository: APIRepository(), coreData: CoreDataManager())
    private var books: [Book] = []
    private var disposeBag = DisposeBag()
    
    let nibWhisBook = String(describing: WhisListTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getWishBooks()
        config()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        HUD.show(.progress)
        viewModel.getWishBooks()
        config()
        wishListTable.reloadData()
        HUD.hide()
    }

    fileprivate func config() {
        wishListTable.delegate = self
        wishListTable.dataSource = self
        wishListTable.register(UINib(nibName: nibWhisBook, bundle: nil),
                           forCellReuseIdentifier: nibWhisBook)
        wishListTable.rowHeight = 130
        wishListTable.tableFooterView = UIView()
        wishListTable.separatorStyle = .none
        wishListTable.backgroundColor = ConstantsColor.Colors.backgroundColor
        view.backgroundColor = ConstantsColor.Colors.backgroundColor
    }
}

extension WishListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: nibWhisBook, for: indexPath) as? WhisListTableViewCell else {
            return UITableViewCell()
        }
        let booksData =  viewModel.bookObject[indexPath.row]
        cell.configUI()
        cell.showData(bookData: booksData)
        cell.selectionStyle = .none
        return cell
    }
}
