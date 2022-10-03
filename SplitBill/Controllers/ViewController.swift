

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    
    var billTotal = 0.0
    var tipPerc = 0.10
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    
    @IBAction func tipSetter(_ sender: UIButton) {
        bill.endEditing(true)
        
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        

        sender.isSelected = true
        
    
        let buttonTitle = sender.currentTitle!
        
     
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
       
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        tipPerc = buttonTitleAsANumber / 100
    }

    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
                
        numberOfPeople = Int(sender.value)
    }
   
    
    @IBAction func calculate(_ sender: UIButton) {
        let bill = bill.text!
        
        if bill != "" {
            
        
            billTotal = Double(bill)!
            
           
            let result = billTotal * (1 + tipPerc) / Double(numberOfPeople)
            
            
            finalResult = String(format: "%.2f", result)
        }
        
       
        self.performSegue(withIdentifier: "resultController", sender: self)
    }
    
   
   
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "resultController" {
            
           
            let destinationViewController = segue.destination as! ResultViewController
            
            destinationViewController.result = self.finalResult            
        }
    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }


}

