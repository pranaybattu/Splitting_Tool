

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    
    var result = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
