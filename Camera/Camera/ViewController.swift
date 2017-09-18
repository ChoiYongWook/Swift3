//
//  ViewController.swift
//  Camera
//
//  Created by YongWook Choi on 2017. 9. 14..
//  Copyright © 2017년 YongWook Choi. All rights reserved.
//

import UIKit
import MobileCoreServices
import Social

extension UIImage {
    func fixOrientation() -> UIImage {
        if self.imageOrientation == UIImageOrientation.up {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        
        if let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext(){
            UIGraphicsEndImageContext()
            return normalizedImage
        } else {
            return self
        }
    }
}

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var originalImage: UIImage?
    var filteredImage: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var seg: UISegmentedControl!

    @IBAction func pick(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            let controller = UIImagePickerController()
            controller.sourceType = .savedPhotosAlbum
            controller.mediaTypes = [kUTTypeImage as String]
            controller.allowsEditing = true
            controller.delegate = self
            
            present(controller, animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let type = info[UIImagePickerControllerMediaType] as? String {
            print("type: \(type)")
            
            if type == kUTTypeImage as String {
                if let meta = info[UIImagePickerControllerMediaMetadata] as? [String: String]{
                    print("meta: \(meta)")
                }
                
                if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                    originalImage = image
                    applyFilter(source: image)
//                    imageView.image = image
                }
            }
        }
        //변경하고 닫는것도 직접 닫아줘야 한다
        picker.dismiss(animated: true, completion: nil)
    }
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            imageView.image = originalImage
            //seg.selectedSegmentIndex = 1
        } else {
            imageView.image = filteredImage
            //seg.selectedSegmentIndex = 0
        }
    }
    
    @IBAction func share(_ sender: Any) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
            let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            vc?.setInitialText("Core Image Filter Sample")
            vc?.add(imageView.image)
            
            present(vc!, animated: true, completion: nil)
        }else {
            print("account not set")
        }
    }
    
    func applyFilter(source: UIImage){
        guard let cgimg = source.cgImage else {
            print("invalid image")
            return
        }
        
        guard let openGlContext = EAGLContext(api: .openGLES2) else {
            print("opengl init failed")
            return
        }
        
        let context = CIContext(eaglContext: openGlContext)
        
        let coreImage = CIImage(cgImage: cgimg)
        
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(coreImage, forKey: "inputImage")
        blurFilter?.setValue(20, forKey: "inputRadius")
        
        let sepiaFilter = CIFilter(name: "CISpepiaTone")
        sepiaFilter?.setValue(blurFilter?.outputImage, forKey: "inputImage")
        sepiaFilter?.setValue(5, forKey: "inputIntensity")
        
        if let output = blurFilter?.outputImage, let result = context.createCGImage(output, from: output.extent){
            filteredImage = UIImage(cgImage: result)
            imageView.image = filteredImage
        }
    }
    
    @IBAction func take(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let controller = UIImagePickerController()
            controller.sourceType = .camera
            controller.mediaTypes = [kUTTypeImage as String]
            controller.allowsEditing = true
            controller.delegate = self
            
            present(controller, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleGesture(_ sender:
        UILongPressGestureRecognizer) {
        if sender.state == .began {
            imageView.image = originalImage
        } else if sender.state == .ended {
            imageView.image = filteredImage
        }
    }


}

