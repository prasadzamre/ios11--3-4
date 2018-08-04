//
//  ViewController.swift
//  sd
//
//  Created by Prasad Zamre on 19/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var image: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
         imagePicker = UIImagePickerController()
        
       
       

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addImageTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        //imagePicker.sourceType = .camera
        
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let ima = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            let selectedImage = ima
            
            image.image = selectedImage
            
            let storageREF = Storage.storage().reference()

            let storageImage = storageREF.child("Image")

            // upoad image

            let images = UIImage(named: "selectedImage")

            let metadata = StorageMetadata()

            storageImage.putData(UIImageJPEGRepresentation(selectedImage, 0.2)!, metadata: metadata) { (data, error) in
                if error != nil
                {
                    print("Eror while uploading")
                }
                else{
                    print("Image uploded sucessfully")
                }
            }
            
            
            
            
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

}

