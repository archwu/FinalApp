//
//  ViewController.swift
//  FinalApp
//
//  Created by AW on 12/13/21.
//

import UIKit
import Alamofire
import PromiseKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonPressed(sender: UIButton) {
        print("login pressed")
        guard let uname = username.text else {return}
        guard let pswd = password.text else {
            return
        }
        //getPicURL(uname, pswd)
    }
    
    @IBAction func registerButtonPressed(sender: UIButton) {
        print("register pressed")
        guard let uname = username.text else {return}
        guard let pswd = password.text else {
            return
        }
        register(uname, pswd)
    }
    
    func getPicURL(_ username: String,_ password: String) -> Promise<Picture> {
        return Promise<Picture> { seal -> Void in
            let url = "https://prod.archwu.me/api/v1/user/self/pic/"
            let user = "archwu0817+2@gmail.com"
            let pasword = "c"
            let credentialData = "\(user):\(pasword)".data(using: String.Encoding.utf8)!
            print(credentialData)
            let base64Credentials = credentialData.base64EncodedData(options: [])
            print(base64Credentials)
            let headers = HTTPHeaders(["Authorization": "Basic \(base64Credentials)"])
            print(headers.value(for: "Authorization"))

            
            AF.request(url, parameters: nil, headers: headers).validate().responseJSON { response in
                if response.error != nil {
                    seal.reject(response.error!)
                }
                let details = JSON(response.data!).array
                
                guard let pic = details!.first else {
                    print("empty")
                    seal.fulfill(Picture())
                    return
                }
                let result = Picture()
                result.url = pic["url"].stringValue
                print(result.url)
                seal.fulfill(result)
            }
        }
    }
    
    func register(_ username: String, _ password: String) -> Promise<String> {
        return Promise<String> { seal -> Void in
            let url = "https://prod.archwu.me/api/v1/user/"
            let user = "archwu0817+3@gmail.com"
            let pasword = "c"

            AF.request(url).responseJSON { response in
                if response.error != nil {
                    seal.reject(response.error!)
                }
                
                let result = String()
                seal.fulfill(result)
            }
        }
    }

}

