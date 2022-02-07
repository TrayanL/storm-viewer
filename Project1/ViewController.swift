//
//  ViewController.swift
//  Project1
//
//  Created by Trayan Lazarov on 7.02.22.
//


//test comment

import UIKit

class ViewController: UITableViewController { //add "Table" for extra functionallity
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad() //call Apple's UIViewController to run its code before my custom code.
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default //built in system type to use FileManager (we will use it to look for files)
        let path = Bundle.main.resourcePath! //tell me where I can find all of my app images, "!" is because the bundle might not have a resource path
        let items = try! fm.contentsOfDirectory(atPath: path) //array of all files found in "resourcePath", "!" is for trying to read the contents of the resource Path
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a pic to load
                pictures.append(item)
            }
        }
        print(pictures)
        pictures.sort()
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //first table view param is the one that's making the request of how many table views it should have
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text? = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController { //storyboard has to be an optional, "as?" is optionally typecasting to our DetailViewController, there are 3 potential break points so by using "if let" we tell Swift not to execute the code below
            vc.selectedImage = pictures[indexPath.row]
            vc.currentPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

