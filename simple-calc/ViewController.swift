//
//  ViewController.swift
//  simple-calc
//
//  Created by LEON LOONG on 1/29/18.
//  Copyright © 2018 leontaolong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var input: String = ""
    var preNum: Double = 0.0
    var inputNums: [Double] = []
    var optr: String = ""
    
    @IBOutlet weak var lbDisplay: UILabel!
    
    // linked to number keys
    @IBAction func num(_ sender: UIButton) {
        input += (sender.titleLabel?.text!)!
        lbDisplay.text = String(input)
    }
    
    // linked to operator keys
    @IBAction func optr(_ sender: UIButton) {
        optr = (sender.titleLabel?.text)!
        preNum = Double(input)!
        if optr == "count" || optr == "avg" {
            self.inputNums.append(preNum)
        }
        if optr == "fact" {
            let fact = getFactorial(Int(Double(input)!))
            lbDisplay.text = String(fact)
        }
        input = ""
    }
    
    // linked to "="
    @IBAction func output(_ sender: UIButton) {
        let result = calculate()
        lbDisplay.text = String(result)
        input = ""
    }
    
    // linked to "c"
    @IBAction func clear(_ sender: UIButton) {
        input = ""
        preNum = 0
        inputNums = []
        optr = ""
        lbDisplay.text = "0"
    }
    
    private func calculate() -> Double {
        switch optr {
        case "+":
            return preNum + Double(input)!
        case "-":
            return preNum - Double(input)!
        case "x":
            return preNum * Double(input)!
        case "/":
            return preNum / Double(input)!
        case "%":
            return Double(Int(preNum) % Int(Double(input)!))
        case "count":
            self.inputNums.append(Double(input)!)
            return Double(self.inputNums.count)
        case "avg":
            self.inputNums.append(Double(input)!)
            return getAvg(self.inputNums)
        default:
            return 0
        }
    }
    
    // get average of a given array of numbers
    private func getAvg(_ nums: [Double]) -> Double {
        return nums.reduce(0.0, +) / Double(nums.count)
    }
    
    // returns factorial of a given number
    private func getFactorial (_ num: Int) -> Int{
        var result = 1
        for i in 1..<num + 1 {
            result = result * i
        }
        return result
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

