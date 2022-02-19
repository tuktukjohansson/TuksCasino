
import Foundation
import UIKit
class StatsVC : UIViewController {
    @IBOutlet weak var Amountofwinslabel: UILabel!
    @IBOutlet weak var Amountoflosseslabel: UILabel!
    @IBOutlet weak var Highestwinlabel: UILabel!
    @IBOutlet weak var Biggestloselabel: UILabel!
    @IBOutlet weak var Highestbetlabel: UILabel!
    @IBOutlet weak var Highestcrashlabel: UILabel!
    override func viewDidLoad()  {
        super.viewDidLoad()
        updatelabels()
    }
    func updatelabels(){
        Amountofwinslabel.text = ("Amount of wins : \(Stats.sharedstats.amountofwins)")
        Amountoflosseslabel.text = ("Amount of losses : \(Stats.sharedstats.amountoflosses)")
        var roundeddouble = String(format: "%.2f", ceil(Stats.sharedstats.highestwin*100)/100)
        Highestwinlabel.text = ("Highest win : \(roundeddouble) $")
        Biggestloselabel.text = ("Biggest loss : \(Stats.sharedstats.biggestlose) $")
        Highestbetlabel.text = ("Highest Bet : \(Stats.sharedstats.highestbet) $")
        roundeddouble = String(format: "%.2f", ceil(Stats.sharedstats.highestcrashvalue*100)/100)
        Highestcrashlabel.text = ("Highest crash multiplier cashout : \(roundeddouble)x")
        
    }
}
