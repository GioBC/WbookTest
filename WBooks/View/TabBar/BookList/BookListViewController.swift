//
//  BookListViewController.swift
//  WBooks
//
//  Created by Yermis Beltran on 18/08/21.
//

import UIKit
import RxSwift
import PKHUD

class BookListViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var BooKListTableView: UITableView!
    
    var viewModel: BookViewModel = BookViewModel(respository: APIRepository(), coreData: CoreDataManager())
    
    private var disposeBag = DisposeBag()
    private var books: [Book] = []
    private var filteredBooks: [Book] = [] {
        didSet {
            BooKListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        searchBar.delegate = self
        loadCell()
        ConfigTable()
        getData()
        viewModel.getBooks()
    }
    
    private func search(using keyword: String) {
        guard !keyword.isEmpty else {
            filteredBooks = books
            return
        }
        filteredBooks = books.filter({ $0.title.lowercased().contains(keyword.lowercased())})
    }
    
    private func getData() {
        HUD.show(.progress)
        viewModel.bookList.asObservable()
            .subscribe(onNext: { books in
            self.books.append(contentsOf: books)
            self.filteredBooks.append(contentsOf: books)
            self.BooKListTableView.reloadData()
                HUD.hide()
        }).disposed(by: disposeBag)
    }

    private func loadCell(){
        BooKListTableView.register(UINib(nibName: BookListCell.key, bundle: Bundle.main), forCellReuseIdentifier: BookListCell.key)
    }
    
    private func ConfigTable() {
        BooKListTableView.dataSource = self
        BooKListTableView.delegate = self
        BooKListTableView.rowHeight = 130
        BooKListTableView.separatorStyle = .none
        BooKListTableView.backgroundColor = ConstantsColor.Colors.backgroundColor
        view.backgroundColor = ConstantsColor.Colors.backgroundColor
    }
}

extension BookListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookListCell.key, for: indexPath) as! BookListCell
        let booksData =  filteredBooks[indexPath.row]
        let bookId = indexPath.row + 1
        cell.configUI()
        cell.ShowCell(with: booksData, idBook: bookId)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = BookDetailViewController(nibName: Constants.storyBoardName.bookDetailViewController, bundle: nil)
        controller.book = filteredBooks[indexPath.row]
        HUD.show(.progress)
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension BookListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(using: searchText)
    }
}
