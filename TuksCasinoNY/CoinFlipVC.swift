
import Foundation
import UIKit
class CoinFlipViewController: UIViewController {
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var betlabel: UILabel!
    @IBOutlet weak var balancelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showbalance()
    }
    var bettingdone = true
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func PlayBTNPush(_ sender: Any) {
        if (bettingdone == true) {
            if (Balance.sharedbalance.mybalance >= Balance.sharedbalance.bettingamount){
                showbet()
                betlabel.isHidden = false
                let mybet = Balance.sharedbalance.bettingamount
                bettingdone = false
                imageViewOutlet.image = UIImage(named:"coin")
                _ = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) {_ in
                    // ---------------------------- Win ------------------------------ \\
                    if self.flip() == true {
                        self.imageViewOutlet.image = UIImage(named:"coin_win")
                        let winamount = mybet * Upgrades.sharedupgrades.coinflipmultiplier.0
                        Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance + winamount
                        Stats.sharedstats.amountofwins = Stats.sharedstats.amountofwins + 1
                        if (winamount > Stats.sharedstats.highestbet){
                            Stats.sharedstats.highestbet = winamount
                        }
                        if (winamount > Stats.sharedstats.highestwin){
                            Stats.sharedstats.highestwin = winamount
                        }
                        if (Balance.sharedbalance.bettingamount > Stats.sharedstats.highestbet){
                            Stats.sharedstats.highestbet = Balance.sharedbalance.bettingamount
                        }
                        
                    }
                    // ---------------------------- Win ------------------------------ \\
                    
                    // ---------------------------- Lose ------------------------------ \\
                    else{
                        self.imageViewOutlet.image = UIImage(named:"coin_lose")
                        Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - mybet
                        Stats.sharedstats.amountoflosses = Stats.sharedstats.amountoflosses + 1
                        if (Balance.sharedbalance.bettingamount > Stats.sharedstats.highestbet){
                            Stats.sharedstats.highestbet = Balance.sharedbalance.bettingamount
                        }
                        if (Balance.sharedbalance.bettingamount > Stats.sharedstats.biggestlose){
                            Stats.sharedstats.biggestlose = Balance.sharedbalance.bettingamount
                        }
                    }
                    // ---------------------------- Lose ------------------------------ \\
                    self.showbalance()
                    self.bettingdone = true
                }
            }
            else{
                alertnomoney()
            }
        }
        else{
            alertnochill()
        }
    }
    func flip() -> Bool{
        let CoinSide = Double.random(in: 0..<Upgrades.sharedupgrades.coinflipchance.0)
        if CoinSide <= 50 {
            return true
        }
        else {
            return false
        }
    }
    func showbet(){
        let roundeddouble = String(format: "%.2f", ceil(Balance.sharedbalance.bettingamount*100)/100)
        betlabel.text = ("Previous Bet : \(roundeddouble) $")
    }
    func showbalance(){
        let roundeddouble = String(format: "%.2f", ceil(Balance.sharedbalance.mybalance*100)/100)
        balancelabel.text = ("Balance : \(roundeddouble) $")
    }
    func alertnomoney(){
        let alert = UIAlertController(title: "Not enough money", message: "You don't have enought money for this bet", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    func alertnochill(){
        let alert = UIAlertController(title: "Please wait!", message: "Please wait for the round to be finished", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK, I'll chill", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
