//
//  ViewController.swift
//  Simple Calculator
//
//  Created by hendra on 03/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Calcwork: UILabel!
    @IBOutlet weak var Calcresult: UILabel!
    
    var workings: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bersihkan()
        // Do any additional setup after loading the view.
    }
    
    func bersihkan(){
        workings = ""
        Calcwork.text = ""
        Calcresult.text = ""
    }
    
    func addToWorkings (value: String){
        workings = workings + value
        Calcwork.text = workings
    }

    @IBAction func Clear(_ sender: Any) {
        bersihkan()
    }
    @IBAction func Delete(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            Calcwork.text = workings
        }
    }
    @IBAction func Persen(_ sender: Any) {
        addToWorkings(value: "%")
    }
    @IBAction func Bagi(_ sender: Any) {
        addToWorkings(value: "/")
    }
    @IBAction func Kali(_ sender: Any) {
        addToWorkings(value: "*")
    }
    @IBAction func Kurang(_ sender: Any) {
        addToWorkings(value: "-")
    }
    @IBAction func Tambah(_ sender: Any) {
        addToWorkings(value: "+")
    }
    @IBAction func Hasil(_ sender: Any) {
        if(checkInput()){
            let checkWorkingForPercentage = workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkWorkingForPercentage)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatReslut(result: result)
            Calcresult.text = resultString
        }else{
            let alert = UIAlertController(title: "Input Salah",
                                          message: "Error", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Oke", style : .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func checkInput() -> Bool {
        var count = 0
        var funcCharIndex = [Int] ()
        
        for char in workings{
            if(specialChar(char: char)){
                funcCharIndex.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndex{
            if (index == 0){
                return false
            }
            if (index == workings.count - 1){
                return false
            }
            
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        
        return true
    }
    
    func specialChar(char : Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    func formatReslut (result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1)==0){
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func Koma(_ sender: Any) {
        addToWorkings(value: ",")
    }
    @IBAction func Nol(_ sender: Any) {
        addToWorkings(value: "0")
    }
    @IBAction func Satu(_ sender: Any) {
        addToWorkings(value: "1")
    }
    @IBAction func Dua(_ sender: Any) {
        addToWorkings(value: "2")
    }
    @IBAction func Tiga(_ sender: Any) {
        addToWorkings(value: "3")
    }
    @IBAction func Empat(_ sender: Any) {
        addToWorkings(value: "4")
    }
    @IBAction func Lima(_ sender: Any) {
        addToWorkings(value: "5")
    }
    @IBAction func Enam(_ sender: Any) {
        addToWorkings(value: "6")
    }
    @IBAction func Tuju(_ sender: Any) {
        addToWorkings(value: "7")
    }
    @IBAction func Delapan(_ sender: Any) {
        addToWorkings(value: "8")
    }
    @IBAction func Sembilan(_ sender: Any) {
        addToWorkings(value: "9")
    }
}

