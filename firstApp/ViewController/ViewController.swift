//
//  ViewController.swift
//  firstApp
//
//  Created by Hany Kh on 13/07/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var detailsButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalzation()
    }
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    func initalzation() {
        customztion(layer: nameLabel.layer)
        customztion(layer: emailLabel.layer)
        customztion(layer: cityLabel.layer)
        customztion(layer: detailsButton.layer)
        customztion(layer: updateButton.layer)
        
        setBorder(layer: detailsButton.layer, color:  UIColor.white, size: 2)
        setBorder(layer: updateButton.layer, color:  UIColor.black, size: 2)
    }
    func setData(){
        let userData = UserData()
        let user = userData.getUserData()
        nameLabel.text = user.name
        emailLabel.text = user.email
        cityLabel.text = user.city
    }
    func customztion(layer:CALayer){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.shadowOpacity = 10
        layer.cornerRadius = 21.75
    }
    func setBorder(layer:CALayer , color:UIColor , size : CGFloat ){
        layer.borderColor = color.cgColor
        layer.borderWidth = size
    }
    
    
    
    @IBAction func details(_ sender: Any) {
        showAlert()
    }
    private func showAlert(){
        let alertV = UIAlertController(title: "Details", message: "Every thing is ok", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        alertV.addAction(alertAction)
        present(alertV, animated: true, completion: nil)
    }
    
    @IBAction func update(_ sender: Any) {
        performSegue(withIdentifier: "GoToUpdate", sender: nil)
    }
}

