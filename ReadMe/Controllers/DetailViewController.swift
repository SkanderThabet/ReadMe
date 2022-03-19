//
//  DetailViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 20/3/2022.
//

import UIKit

class DetailViewController: UIViewController {
    let book : Book

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = book.image
        titleLabel.text = book.title
        authorLabel.text = book.author

        // Do any additional setup after loading the view.
    }
    required init?(coder: NSCoder) {
        fatalError("this should never be called")
    }
    init?(coder: NSCoder, book: Book) {
        self.book = book
        super.init(coder: coder)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
