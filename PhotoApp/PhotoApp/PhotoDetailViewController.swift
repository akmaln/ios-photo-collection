//
//  PhotoDetailViewController.swift
//  PhotoApp
//
//  Created by Akmal Nurmatov on 3/26/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit
import Photos

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper? 
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func addPhotoButton(_ sender: Any) {
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            var newImage: UIImage

            if let possibleImage = info[.editedImage] as? UIImage {
                newImage = possibleImage
            } else if let possibleImage = info[.originalImage] as? UIImage {
                newImage = possibleImage
            } else {
                return
            }

            // do something interesting here!
            print(newImage.size)

            dismiss(animated: true)
        }
        
    }
    @IBAction func savePhotoButton(_ sender: Any) {
        guard let image = imageView.image, let imageData = image.jpegData(compressionQuality: 1.0), let title = nameTextField.text else { return }
 
        if let photo = photo {
            photoController?.update(photo: photo, data: imageData, string: title)
        } else {
            photoController?.create(data: imageData, title: title)
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else {return}
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = .blue
        default:
            break
        }
        view.backgroundColor = backgroundColor
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        
        imageView.image = UIImage(data: photo.imageData)
        nameTextField.text = photo.title
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme() 

        // Do any additional setup after loading the view.
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
