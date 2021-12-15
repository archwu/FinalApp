//
//  PhotosViewController.swift
//  FinalApp
//
//  Created by AW on 12/14/21.
//

import UIKit
import Alamofire

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var tblView: UITableView!
    
    var arr = ["photo1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PhotoViewController
        destinationVC.url = "https://s3.amazonaws.com/7z0.prod.domain.tld/weather.png"
    }
    
    
    @IBAction func addPic(_ sender: Any) {
        let alertController = UIAlertController(title: "Take a Picture", message: "Select Camera or Photo Library", preferredStyle: .alert)
            
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = UIImagePickerController.SourceType.camera
                    imagePicker.allowsEditing = false
                    self.present(imagePicker, animated: true, completion: nil)
                }
        
            }
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                    imagePicker.allowsEditing = false
                    self.present(imagePicker, animated: true, completion: nil)
                }
                
            }
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { action in
                print("User selected Cancel")
        
            }
            
            alertController.addAction(cameraAction)
            alertController.addAction(photoLibraryAction)
            alertController.addAction(cancel)
            
            self.present(alertController, animated: true, completion: nil)


            
        }
}
