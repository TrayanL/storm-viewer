//
//  DetailViewController.swift
//  Project1
//
//  Created by Trayan Lazarov on 7.02.22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView! //@IBOutlet shows that this is connected to InterfaceBuilder, UIImageView! starts as nil but will contain a view before unwrapped
    var selectedImage: String?
    var currentPictureNumber: Int?
    var totalPictures: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image \(currentPictureNumber!) of \(totalPictures!)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage { //this is what checks and unwraps the optional in the "selectedImage" property
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
