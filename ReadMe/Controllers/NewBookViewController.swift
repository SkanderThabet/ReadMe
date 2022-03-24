//
//  NewBookViewController.swift
//  ReadMe
//
//  Created by Skander Thabet on 24/3/2022.
//

import UIKit

class NewBookViewController: UITableViewController{
    //outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var bookImageView: UIImageView!
    
    //Actions
    @IBAction func updateImage() {
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
        bookImageView.layer.cornerRadius = 16

        // Do any additional setup after loading the view.
    }
    
    
    
}
extension NewBookViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        bookImageView.image = selectedImage
        dismiss(animated: true)
    }
}
// We need UITextField delegate for our text fields
//
extension NewBookViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            //here we switch to the next text field
            return authorTextField.becomeFirstResponder()
        } else {
            return textField.resignFirstResponder()
        }
    }
}
