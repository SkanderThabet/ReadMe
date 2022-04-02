//
//  ViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 19/3/2022.
//

import UIKit

class LibraryHeaderView : UITableViewHeaderFooterView {
    static let reuseIdentifier = "\(LibraryHeaderView.self)"
    @IBOutlet var titleLabel: UILabel!
}

class LibraryViewController: UITableViewController {
    
    // Segue Action to import data from Library VC => Detail VC
    @IBSegueAction func showDetailView(_ coder: NSCoder) -> DetailViewController? {
        guard let indexPath = tableView.indexPathForSelectedRow
        else {
            fatalError("Nothing Selected!")
        }
        let book = Library.books[indexPath.row]
        return DetailViewController(coder: coder, book: book)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(UINib(nibName: "\(LibraryHeaderView.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: LibraryHeaderView.reuseIdentifier)
    }
    
    //This will reload the cell with the uploaded images
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //Mark:- Delegate
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 1 ? "Read Me!" : nil
    }
    
    //setup our Library Header View
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return nil}
        
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: LibraryHeaderView.reuseIdentifier) as? LibraryHeaderView
        else {return nil}
        headerView.titleLabel.text = "Read Me!"
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section != 0 ? 60 : 0
    }
    
    //Mark:- DataSource
    
    
    //number of section we need
    override func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    //The number of things that go in this section
    // Update number of rows in section , if it's 0 we need 1 section if 1 section we need 2 sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section==0 ? 1 :  Library.books.count
    }
    //This method is to setup the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath == IndexPath(row: 0, section: 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewBookCell", for: indexPath)
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(BookCell.self)", for: indexPath) as? BookCell
        else { fatalError("Could not create BookCell") }
        
        let book = Library.books[indexPath.row]
        cell.titleLabel.text=book.title
        cell.authorLabel?.text=book.author
        cell.bookThumbnail?.image=book.image
        cell.bookThumbnail.layer.cornerRadius = 12
        return cell
    }
    
    
}

