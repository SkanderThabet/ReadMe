//
//  ViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 19/3/2022.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    // Segue Action to import data from Library VC => Detail VC
    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow
        else {
            fatalError("Nothing Selected!")
        }
        let book = Library.books[indexPath.row - 1]
        return DetailViewController(coder: coder, book: book)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //This will reload the cell with the uploaded images
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //Mark:- DataSource
    //The number of things that go in this section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Library.books.count + 1
    }
    //This method is to setup the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath == IndexPath(row: 0, section: 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell
        else { fatalError("Could not create BookCell") }
        
        let book = Library.books[indexPath.row - 1]
        cell.titleLabel.text=book.title
        cell.authorLabel?.text=book.author
        cell.bookThumbnail?.image=book.image
        cell.bookThumbnail.layer.cornerRadius = 12
        return cell
    }
    
    
}

