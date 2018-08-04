//
//  File.swift
//  quiz
//
//  Created by Prasad Zamre on 14/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class File: UIViewController  {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose
}
    
    @IBAction func signup(_ sender: Any) {
        
        SVProgressHUD.show()
        
        
        print("Its working")
        
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) {
            (user, error) in
            if error != nil{
                print(error!)
                
                SVProgressHUD.dismiss()
               
            }
            else{
                //Sucess
                print("Registration is sucessfull")
                
                Auth.auth().currentUser?.sendEmailVerification(completion: { (eror) in
                    print("Error while sending email")
                })
                
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "gotomain", sender: self)
                
                
            }
        }
        
    }
}
