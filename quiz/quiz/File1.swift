//
//  File1.swift
//  quiz
//
//  Created by Prasad Zamre on 14/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class File1: UIViewController{
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func login(_ sender: Any) {
        
        
        SVProgressHUD.show()
        
        
        print("Its working")
        
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) {
            (user, error) in
            if error != nil{
                print(error!)
                SVProgressHUD.dismiss()
                
            }
            else{
                print("login sucessfull")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "gotomain", sender: self)
            }
        
    }
        
    }
    
}
