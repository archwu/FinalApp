//
//  PhotosViewController.swift
//  FinalApp
//
//  Created by AW on 12/14/21.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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
    
    
}
