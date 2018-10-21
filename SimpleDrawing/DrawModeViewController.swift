//
//  DrawModeViewController.swift
//  SimpleDrawing
//
//  Created by mino on 10/20/18.
//  Copyright © 2018 mino. All rights reserved.
//

import UIKit

class DrawModeViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate
 {
    
    
    @IBOutlet weak var image: UIImageView!
    
    
    @IBOutlet weak var ColorStack: UIStackView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    //MARK - Image Picker Functions 
    
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // Dismiss the picker if the user canceled.
            dismiss(animated: true, completion: nil)
        }
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
            guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
                fatalError("Expected a dictionary containing an image, but was provided the following: \(info)") }
    
            // Set photoImageView to display the selected image.
            image.image = selectedImage
            // Dismiss the picker.
            dismiss(animated: true, completion: nil)
    
        }
    
    @IBAction func SelectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        
        let ImagePicker = UIImagePickerController()
        ImagePicker.sourceType = .photoLibrary
        ImagePicker.delegate = self
        present(ImagePicker, animated: true, completion: nil)
    }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
       

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
