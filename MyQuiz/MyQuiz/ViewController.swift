//
//  ViewController.swift
//  MyQuiz
//
//  Created by Apple on 31.01.2021.
//

import UIKit

class ViewController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction func startQuiz(){
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as! QuizViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
