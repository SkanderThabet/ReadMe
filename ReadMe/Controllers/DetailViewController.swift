//
//  DetailViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 20/3/2022.
//

import UIKit

class DetailViewController: UIViewController {
    let book : Book

    //Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    //Actions
    @IBAction func updateImage(){
        let imagePicker = UIImagePickerController()
        //we want this Controller to be delegate
        imagePicker.delegate = self
        imagePicker.sourceType =
        UIImagePickerController.isSourceTypeAvailable(.camera)
        ? .camera
        : .photoLibrary
        imagePicker.allowsEditing = true
         present(imagePicker, animated: true)
    
    }
    
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
}

// This extension is for letting know our Controller that we picked a photo and do something about it
extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        imageView.image = selectedImage
        Library.saveImage(selectedImage, forBook: book)
        dismiss(animated: true)
    }
}
