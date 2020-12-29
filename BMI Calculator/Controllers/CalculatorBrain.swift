//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mohamed Jaber on 11/21/20.
//

import UIKit

struct CalculatorBrain{
 
    //var bmi: Float?
    var bmi: BMI?
    func getResult()->String{
        if bmi != nil{
     //   let x=String(format: "%.1f",bmi!) //if u afraid to of (bmi) being nil so u can use (bmi ?? 0.0) and give default value
            let x=String(format: "%.1f",bmi?.value ?? 0.0)
            return x
            
        }
        else {
            return "0.0"
        }
    }
    func getColor() -> UIColor {
            return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    func getAdvice()->String{
        return bmi!.advice
    }
    mutating func CalculatorBMI(height: Float,weight: Float){
        
        let bmiValue=weight/(height*height)
        if bmiValue<18.5{
            bmi=BMI(value: bmiValue, advice: "U should eat more food", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
        else if bmiValue>18.5 || bmiValue<24.9{
            bmi=BMI(value: bmiValue, advice: "Keep doing it, u are great", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }
        else {
            bmi=BMI(value: bmiValue, advice: "U should eat less food", color: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1))
        }
    }
}
