//
//  ViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 19/3/2022.
//

import UIKit

class LibraryViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Mark:- DataSource
    //The number of things that go in this section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Library.books.count
    }
    //This method is to setup the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath)
        let book = Library.books[indexPath.row]
        cell.textLabel?.text=book.title
        cell.imageView?.image=book.image
        return cell
    }
    
    
}

