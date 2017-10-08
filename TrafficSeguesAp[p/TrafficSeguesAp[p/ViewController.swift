//
//  ViewController.swift
//  TrafficSeguesAp[p
//
//  Created by Qasim Ahmed on 2017-10-06.
//  Copyright © 2017 Qasim Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func unwindToRed(unwindSegue : UIStoryboardSegue){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.title = textField.text;
    }
}

