//
//  ViewController.swift
//  Navigation
//
//  Created by Htrucci on 2017. 6. 24..
//  Copyright © 2017년 Htrucci. All rights reserved.
//

import UIKit

protocol ViewDelegate{
    func didChangeEditBtn(controller: ViewController, isOn: Bool)
}


class ViewController: UIViewController, EditDelegate {

    
    let lampOn = UIImage(named: "lamp-on.png")
    let lampOff = UIImage(named: "lamp-off.png")
    var isOn = false
    var delegate : ViewDelegate?
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = lampOff
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton"{
            editViewController.textWayValue = "segue : use button"
        }else if segue.identifier == "editBarButton"{
            editViewController.textWayValue = "segue : use Bar button"
        }
        editViewController.delegate = self
        if isOn{
            editViewController.isOn = true
        }else{
            editViewController.isOn = false
        }
        
        //delegate?.didChangeEditBtn(controller: self, isOn: self.isOn)
        
    }

    func didMessageEditDone(controller: EditViewController, message: String) {
        txMessage.text = message
    }
    
    func didImageOnOffDone(controller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = lampOn
            self.isOn = true
        }else{
            imgView.image = lampOff
            self.isOn = false
        }
    }


}

