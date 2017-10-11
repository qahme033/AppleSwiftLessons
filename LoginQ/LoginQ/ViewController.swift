//
//  ViewController.swift
//  LoginQ
//
//  Created by Qasim Ahmed on 2017-10-09.
//  Copyright © 2017 Qasim Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func forgottenUsernamePressed(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
    @IBAction func forgottenPasswordPressed(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)

    }
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    
    @IBOutlet weak var forgottenUsernameButton: UIButton!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return };
        if sender == forgottenUsernameButton{
            segue.destination.navigationItem.title = "Forgotten Username"
        }else if sender == forgottenPasswordButton {
            segue.destination.navigationItem.title = "Forgotten Password"
        }else {
            segue.destination.navigationItem.title = userNameTextField.text;

        }
    }


}

