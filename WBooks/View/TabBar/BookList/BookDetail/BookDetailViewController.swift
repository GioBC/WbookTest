//
//  BookDetailViewController.swift
//  WBooks
//
//  Created by Yermis Beltran on 19/08/21.
//

import UIKit
import PKHUD
import AlamofireImage

class BookDetailViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var addToWishButton: UIButton!
    @IBOutlet weak var addToRentailButton: UIButton!
    
    var book: Book?
    var viewModel: BookViewModel = BookViewModel(respository: APIRepository(), coreData: CoreDataManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congifUI()
        configDetailView()
        HUD.hide()
    }
    
    func congifUI() {
        addToWishButton.layer.borderColor = ConstantsColor.Colors.blueColor.cgColor
        addToWishButton.layer.borderWidth = 1
        addToWishButton.layer.cornerRadius = 5
        addToRentailButton.layer.cornerRadius = 5
        addToRentailButton.backgroundColor = ConstantsColor.Colors.blueColor
        view.backgroundColor = ConstantsColor.Colors.backgroundColor
    }

    func configDetailView() {
        titleLabel.text = book?.title
        authorLabel.text = book?.author
        stateLabel.text = book?.status
        yearLabel.text = book?.year
        genre.text = book?.genre
        
        let downloader = ImageDownloader()
        guard let image = book?.image else { return }
        let http = image
        let https = "https" + http.dropFirst(4)
        guard let url = URL(string: https) else {
            bookImage.image = #imageLiteral(resourceName: "noImageAvalible")
            return
        }
        
        let urlRequest = URLRequest(url: url)

        downloader.download(urlRequest, completion: { response in
            if case .success(let image) = response.result {
                self.bookImage.image = image
            }
        })
    }
    
    func showError(msg: String) {
        
        let alertController = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Accept", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func AddToWish(_ sender: Any) {
         let bookImageHttps = book!.image
         let bookImageResult = "https" + bookImageHttps.dropFirst(4)
        
        viewModel.saveBook(id: book?.id ?? 0,
                           title: book?.title ?? "",
                           author: book?.author ?? "",
                           year: book?.year ?? "",
                           status: book?.status ?? "",
                           genre: book?.genre ?? "",
                           image: bookImageResult)
        showError(msg: "Send to you wishlist succesfuly !!")
    }
}
