//
//  ViewController.swift
//  camera
//
//  Created by Guled Ali on 3/19/19.
//  Copyright © 2019 Guled Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
   
    //imageView
    @IBOutlet weak var photoView: UIImageView!
    let photoStore = PhotoStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = photoStore.getPhoto()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Photo Frame"
        
    }
    //Selecting new image from savedPhotoes
    @IBAction func newPhotoButton(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .savedPhotosAlbum
        }
        present(imagePicker, animated: true, completion: nil)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        photoView.image = image
        photoStore.savePhoto(image: image)
        picker.dismiss(animated: true, completion: nil)
    }
    
}

