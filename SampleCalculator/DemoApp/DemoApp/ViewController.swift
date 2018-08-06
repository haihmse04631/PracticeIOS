//
//  ViewController.swift
//  DemoApp
//
//  Created by Hoàng Hải on 7/27/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvNumberA: UITextField!
    @IBOutlet weak var tvNumberB: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnDiv: UIButton!
    @IBOutlet weak var btnSub: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    var status = Int()
    var listOperator = [UIButton]()
    var numberA : Int?
    var numberB : Int?
    var statusResult = String("")
    enum CalculatorOperator: Int {
        case noOperator = 0
        case add = 1
        case sub = 2
        case mul = 3
        case div = 4
    }
    
    func setColorForButton(selectedButtonIndex: UIButton) {
        for btn in listOperator{
            if(btn == selectedButtonIndex){
                btn.setTitleColor(UIColor.red, for: .normal)
            }else{
                btn.setTitleColor(UIColor.blue, for: .normal)
            }
        }
    }
    
    @IBAction func add(_ sender: Any) {
        status = CalculatorOperator.add.rawValue
        setColorForButton(selectedButtonIndex: btnAdd)
    }
    
    @IBAction func sub(_ sender: Any) {
        status = CalculatorOperator.sub.rawValue
        setColorForButton(selectedButtonIndex: btnSub)
    }
    
    @IBAction func mul(_ sender: Any) {
        status = CalculatorOperator.mul.rawValue
        setColorForButton(selectedButtonIndex: btnMul)
    }
    
    @IBAction func div(_ sender: Any) {
        status = CalculatorOperator.div.rawValue
        setColorForButton(selectedButtonIndex: btnDiv)
    }
    
    @IBAction func Result(_ sender: Any) {
        var isEmptyTextField = false
        if tvNumberA.text != "" {
            numberA = Int(tvNumberA.text!)
        }else{
            statusResult = "number a is empty \n"
            isEmptyTextField = true
        }
        if tvNumberB.text != "" {
            numberB = Int(tvNumberB.text!)
        }else{
            statusResult += "number b is empty"
            isEmptyTextField = true
        }
        if isEmptyTextField {
            let alertController = UIAlertController(title: "Simple Calculator", message: statusResult, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            isEmptyTextField = false
            statusResult = ""
            return
        }
        switch status {
        case CalculatorOperator.add.rawValue:
            lblResult.text = String(numberA! + numberB!)
        case CalculatorOperator.sub.rawValue:
            lblResult.text = String(numberA! - numberB!)
        case CalculatorOperator.mul.rawValue:
            lblResult.text = String(numberA! * numberB!)
        case CalculatorOperator.div.rawValue:
            if numberB == 0 {
                lblResult.text = String("Number b is not equal 0")
            }else{
                lblResult.text = String(numberA! / numberB!)
            }
        case CalculatorOperator.noOperator.rawValue:
            lblResult.text = "Please tap one operator!"
        default:
            lblResult.text = "Error!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listOperator.append(btnAdd)
        listOperator.append(btnSub)
        listOperator.append(btnMul)
        listOperator.append(btnDiv)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

