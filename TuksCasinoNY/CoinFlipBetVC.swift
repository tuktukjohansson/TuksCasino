import Foundation
import UIKit
class BetVC : UIViewController {
    @IBOutlet weak var MyBetLabel: UILabel!
    @IBOutlet weak var MyBalanceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showbet(AddAmount : 0)
        showbalance()
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func AddOneButton(_ sender: Any) {
        showbet(AddAmount: 1.0)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func AddFiveButton(_ sender: Any) {
        showbet(AddAmount: 5.0)
    }
    @IBAction func AddFiftyButton(_ sender: Any) {
        showbet(AddAmount: 50.0)
    }
    @IBAction func AddFiveHButton(_ sender: Any) {
        showbet(AddAmount: 500.0)
    }
    @IBAction func AddFiveKButton(_ sender: Any) {
        showbet(AddAmount: 5000.0)
    }
    @IBAction func AddHundredKButton(_ sender: Any) {
        showbet(AddAmount: 100000.0)
    }
    @IBAction func ResetBetButton(_ sender: Any) {
        Balance.sharedbalance.bettingamount = 0
        MyBetLabel.text = ("Bet : 0 $")
        MyBetLabel.textColor = UIColor.green
    }
    @IBAction func cancel(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showbet(AddAmount : Double){
        Balance.sharedbalance.bettingamount = Balance.sharedbalance.bettingamount + AddAmount
        if betaffordable() == true {
            MyBetLabel.text = ("Bet : \(Balance.sharedbalance.bettingamount) $")
            MyBetLabel.textColor = UIColor.green
        }
        else{
            MyBetLabel.text = ("Bet : \(Balance.sharedbalance.bettingamount) $")
            MyBetLabel.textColor = UIColor.red
        }
    }
    
    
    func betaffordable() -> Bool{
        if Balance.sharedbalance.mybalance >= Balance.sharedbalance.bettingamount{
            return true
        }
        else{
            return false
        }
    }
    func showbalance(){
        let roundeddouble = String(format: "%.1f", ceil(Balance.sharedbalance.mybalance*100)/100)
        MyBalanceLabel.textColor = UIColor.blue
        MyBalanceLabel.text = ("Balance : \(roundeddouble) $")
    }
}
