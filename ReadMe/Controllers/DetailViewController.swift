//
//  DetailViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 20/3/2022.
//

import UIKit

class DetailViewController: UITableViewController {
    let book : Book

    //Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var reviewTextView: UITextView!
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
        imageView.layer.cornerRadius = 16
        titleLabel.text = book.title
        authorLabel.text = book.author
        
        if book.review != nil {
            reviewTextView.text = book.review
        }
        reviewTextView.addDoneButton()

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
// Tell the Controller that this is a ui text view delegate
extension DetailViewController: UITextViewDelegate {
    //implement the text view did end method
    func textViewDidEndEditing(_ textView: UITextView) {
        //tell the text view resign first responder
        textView.resignFirstResponder()
    }
}

//Done button
extension UITextView {
    //add function done button
    func addDoneButton() {
        //start making ui toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //make done btn
        //for the selector part we will call the resignfirstResponder method to dismiss the keyboard
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.resignFirstResponder))
        //add both of these item to the toolbar
        toolbar.items = [flexSpace,doneButton]
        //tell the textview to use the toolbar as it's input accesorry view
        self.inputAccessoryView = toolbar
    }
}
