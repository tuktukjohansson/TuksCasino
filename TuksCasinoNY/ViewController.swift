
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func DailyCoinsButton(_ sender: Any) {
        alertadd5k()
        Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance + 500
    }
    func alertadd5k(){
        let alert = UIAlertController(title: "500 Has been added", message: "Good luck!", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Thx!", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

