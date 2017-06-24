//
//  EditViewController.swift
//  Navigation
//
//  Created by Htrucci on 2017. 6. 24..
//  Copyright © 2017년 Htrucci. All rights reserved.
//

import UIKit


//Delegate생성

protocol EditDelegate {
    func didMessageEditDone(controller: EditViewController, message: String)
    func didImageOnOffDone(controller: EditViewController, isOn:Bool)
}

class EditViewController: UIViewController, ViewDelegate {

    @IBOutlet weak var swlsOn: UISwitch!
    var textWayValue: String = ""
    var textMessage: String = ""
    var delegate : EditDelegate?
    var isOn = false
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txMessage: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = isOn
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBarDone(_ sender: UIBarButtonItem) {
        if delegate != nil{
            delegate?.didMessageEditDone(controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(controller: self, isOn: isOn)
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(controller: self, isOn: isOn)
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
        }else{
            isOn = false
        }
    }

    func didChangeEditBtn(controller: ViewController, isOn: Bool) {
        NSLog("Test")
        if isOn{
            self.isOn = true
            swlsOn.setOn(true, animated: true)
        }else{
            self.isOn = false
            swlsOn.setOn(false, animated: true)
        }
    }
}
