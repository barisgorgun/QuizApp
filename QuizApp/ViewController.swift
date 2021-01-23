//
//  ViewController.swift
//  QuizApp
//
//  Created by MacBook on 23.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHighScore: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        lblHighScore.text = "Last Score: \(UserDefaults.standard.string(forKey: "score") ?? "0")"
    }

}

