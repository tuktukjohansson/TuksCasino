import Foundation
import UIKit
class CrashViewController: UIViewController {
    @IBOutlet weak var Changebetbutton: UIButton!
    @IBOutlet weak var winorloselabel: UILabel!
    @IBOutlet weak var Enterbutton: UIButton!
    @IBOutlet weak var Exitbutton: UIButton!
    @IBOutlet weak var GameLabel: UILabel!
    @IBOutlet weak var Balancelabel: UILabel!
    @IBOutlet weak var Betlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        showbalance()
    }
    var gameshouldend = false
    override var prefersStatusBarHidden: Bool {
        return true
    }
    @IBAction func enterroundbutton(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Balance.sharedbalance.bettingamount){
            Enterbutton.isHidden = true
            Changebetbutton.isHidden = true
            Exitbutton.isHidden = false
            showbet()
            Betlabel.isHidden = false
            var counter = 1.00
            var countadder = 0.01
            let crashpoint = crashnumber()
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                // ---------------------------- Win ------------------------------ \\
                if (self.gameshouldend == true){
                    timer.invalidate()
                    self.Enterbutton.isHidden = true
                    self.winorloselabel.isHidden = false
                    var winamount = Balance.sharedbalance.bettingamount * counter
                    winamount = winamount - Balance.sharedbalance.bettingamount
                    winamount = winamount * Upgrades.sharedupgrades.crashmultiplier.0
                    Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance + winamount
                    self.losewinprinter(win: true, Amount: winamount)
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer2 in
                        self.Enterbutton.isHidden = false
                        self.winorloselabel.isHidden = true
                        self.Changebetbutton.isHidden = false
                        self.gameshouldend = false
                        self.showbalance()
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
                        if (counter > Stats.sharedstats.highestcrashvalue){
                            Stats.sharedstats.highestcrashvalue = counter
                        }
                    }
                }
                // ---------------------------- Win ------------------------------ \\
                
                // ---------------------------- Lose ------------------------------ \\
                else {
                    if (counter > crashpoint) {
                        timer.invalidate()
                        self.Enterbutton.isHidden = true
                        self.Exitbutton.isHidden = true
                        self.winorloselabel.isHidden = false
                        self.GameLabel.text = ("CRASH!")
                        self.gameshouldend = false
                        Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Balance.sharedbalance.bettingamount
                        self.losewinprinter(win: false, Amount: Balance.sharedbalance.bettingamount)
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer2 in
                            Stats.sharedstats.amountoflosses = Stats.sharedstats.amountoflosses + 1
                            self.Changebetbutton.isHidden = false
                            self.Enterbutton.isHidden = false
                            self.winorloselabel.isHidden = true
                            self.showbalance()
                            if (Balance.sharedbalance.bettingamount > Stats.sharedstats.highestbet){
                                Stats.sharedstats.highestbet = Balance.sharedbalance.bettingamount
                            }
                            if (Balance.sharedbalance.bettingamount > Stats.sharedstats.biggestlose){
                                Stats.sharedstats.biggestlose = Balance.sharedbalance.bettingamount
                            }
                        }
                    }
                    // ---------------------------- Lose ------------------------------ \\
                    
                    // ---------------------------- Ticker ------------------------------ \\
                    else{
                        counter = counter + countadder
                        let roundeddouble = String(format: "%.2f", ceil(counter*100)/100)
                        self.GameLabel.text = ("\(roundeddouble)")
                        countadder = countadder * 1.02
                    }
                    // ---------------------------- Ticker ------------------------------ \\
                }
            }
        }
        else{
            alertnomoney()
        }
    }
    @IBAction func Exitround(_ sender: Any) {
        self.Exitbutton.isHidden = true
        gameshouldend = true
    }
    func alertnomoney(){
        let alert = UIAlertController(title: "Not enough money", message: "You don't have enought money for this bet", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    func crashnumber() -> Double{
        let crashonstart = Double.random(in: 1...Upgrades.sharedupgrades.crashonstart.0)
        if (crashonstart <= 1.5){
            let crashnbr = 1.00
            return crashnbr
        }
        else{
            let crashbefore2 = Double.random(in: 1...Upgrades.sharedupgrades.crashbefore2.0)
            if crashbefore2 <= 7 {
                let crashnbr = Double.random(in: 1...2)
                return crashnbr
            }
            else {
                let crashbefore10 = Double.random(in: 1...Upgrades.sharedupgrades.crashbefore10.0)
                if crashbefore10 <= 7 {
                    let crashnbr = Double.random(in: 2...10)
                    return crashnbr
                }
                else {
                    let crashnbr = Double.random(in: 10...Upgrades.sharedupgrades.maximumcrash.0)
                    return crashnbr
                }
            }
        }
    }
    func losewinprinter(win : Bool, Amount : Double){
        let roundedamount = String(format: "%.2f", ceil(Amount*100)/100)
        if (win == true){
            self.winorloselabel.textColor = UIColor.green
            self.winorloselabel.text = ("You won \(roundedamount) $")
        }
        else {
            self.winorloselabel.textColor = UIColor.red
            self.winorloselabel.text = ("You lost \(roundedamount) $")
        }
    }
    func showbet(){
        Betlabel.isHidden = false
        let roundeddouble = String(format: "%.2f", ceil(Balance.sharedbalance.bettingamount*100)/100)
        Betlabel.text = ("Previous Bet : \(roundeddouble) $")
    }
    func showbalance(){
        let roundeddouble = String(format: "%.2f", ceil(Balance.sharedbalance.mybalance*100)/100)
        Balancelabel.text = ("Balance : \(roundeddouble) $")
    }
}
