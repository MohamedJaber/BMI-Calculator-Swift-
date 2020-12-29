//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 11/21/2020.
//  Copyright © 2020 Mohamed Jaber. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightValue: UISlider!
    @IBOutlet weak var weightValue: UISlider!
    var bmiValue="0.0"
    var calculatorBrain=CalculatorBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        let x=String(format: "%.2f", heightValue.value)
        heightLabel.text="\(x) m"
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        let y=String(Int(weightValue.value))
        weightLabel.text="\(y) kg"
    }
    @IBAction func calculateBtn(_ sender: UIButton) {
        let x=heightValue.value
        let y=weightValue.value
        calculatorBrain.CalculatorBMI(height: x,weight: y)
       //  let Bmi:Float=y!/pow(x,2) //we don't use it any more coz we using struct
       // bmiValue=String(format: "%.1f",Bmi)
        
     /*   let secondVC=SecondViewController()
        secondVC.bmiValue=String(format:" %.1f" ,Bmi)
        self.present(secondVC, animated: true, completion: nil)*/
        self.performSegue(withIdentifier: "goToResult", sender: self) //to direct this button to go to this page.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult" {
            let destinationVC=segue.destination as! ResultViewController
            //destinationVC.bmiValue=bmiValue
            destinationVC.bmiValue=calculatorBrain.getResult()
            destinationVC.advice=calculatorBrain.getAdvice()
            destinationVC.color=calculatorBrain.getColor()
        }
}

}
