//
//  UpdateViewController.swift
//  firstApp
//
//  Created by Hany Kh on 14/07/2020.
//  Copyright © 2020 Hany Kh. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameTextFeild: UITextField!
    @IBOutlet weak var emailTextFeiled: UITextField!
    @IBOutlet weak var cityTextFeiled: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    
    let userdata = UserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialization()
        setBio()
        
    }
    func setBio() {
        let user = userdata.getUserData()
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func updateAction(_ sender: Any) {
        if cheack() {
            
            let user = User(name: nameTextFeild.text!, email: emailTextFeiled.text!, city: cityTextFeiled.text!)
            userdata.save(user: user)
            clear()
            alertmassege(titel:"Update is Successful",massege:"the information is updated",actionTitel:"Thanks",actionStyle: .default)
            setBio()
        }else{
            alertmassege(titel:"Update is Faild",massege:"the information is not updated",actionTitel:"Cancel",actionStyle: .cancel)
        }
    }
    func cheack() ->Bool {
        if nameTextFeild.text!.isEmpty || emailTextFeiled.text!.isEmpty || cityTextFeiled.text!.isEmpty{
            return false
        }
        return true
    }
    func clear(){
        nameTextFeild.text = ""
        emailTextFeiled.text = ""
        cityTextFeiled.text = ""
    }
    
    func alertmassege(titel:String,massege:String,actionTitel:String,actionStyle:UIAlertAction.Style) {
        let alert = UIAlertController(title: titel, message: massege, preferredStyle: .alert)
        let action = UIAlertAction(title: actionTitel, style: actionStyle, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    func intialization() {
        customztion(layer: nameTextFeild.layer)
        customztion(layer: cityTextFeiled.layer)
        customztion(layer: emailTextFeiled.layer)
        customztion(layer: updateButton.layer)
        setBorder(layer: updateButton.layer, color: .black, size: 5)
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
