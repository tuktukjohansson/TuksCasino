
import Foundation
import UIKit
class UpgradeCFVC: UIViewController {
    @IBOutlet weak var PriceChance: UILabel!
    @IBOutlet weak var PriceMultiplier: UILabel!
    @IBOutlet weak var levelxchance: UILabel!
    @IBOutlet weak var Levelxmultiplier: UILabel!
    @IBOutlet weak var Balancelbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showbalance()
        showpricelabel()
        showupgradeslabels()
        // Do any additional setup after loading the view.
    }
    @IBAction func Upgrademultiplier(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.coinflipmultiplier.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.coinflipmultiplier.2
            showbalance()
            Upgrades.sharedupgrades.coinflipmultiplier.0 = Upgrades.sharedupgrades.coinflipmultiplier.0 * 1.10
            Upgrades.sharedupgrades.coinflipmultiplier.1 = Upgrades.sharedupgrades.coinflipmultiplier.1 + 1
            Upgrades.sharedupgrades.coinflipmultiplier.2 = Upgrades.sharedupgrades.coinflipmultiplier.2 * 1.5
            showpricelabel()
            showupgradeslabels()
        }
        else{
            alertnomoney()
        }
    }
    @IBAction func Upgradechance(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.coinflipchance.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.coinflipchance.2
            showbalance()
            Upgrades.sharedupgrades.coinflipchance.0 = Upgrades.sharedupgrades.coinflipchance.0 + 4
            Upgrades.sharedupgrades.coinflipchance.1 = Upgrades.sharedupgrades.coinflipchance.1 + 1
            Upgrades.sharedupgrades.coinflipchance.2 = Upgrades.sharedupgrades.coinflipchance.2 * 1.5
            showpricelabel()
            showupgradeslabels()
        }
        else{
            alertnomoney()
        }
    }
    func alertnomoney(){
        let alert = UIAlertController(title: "Not enough money", message: "You don't have enought money for this upgrade", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    func showbalance(){
        let roundeddouble = String(format: "%.2f", ceil(Balance.sharedbalance.mybalance*100)/100)
        Balancelbl.text = ("Balance : \(roundeddouble) $")
    }
    func showpricelabel(){
        PriceChance.text = ("Price : \(Upgrades.sharedupgrades.coinflipchance.2) $")
        PriceMultiplier.text = ("Price : \(Upgrades.sharedupgrades.coinflipmultiplier.2) $")
    }
    func showupgradeslabels(){
        levelxchance.text = ("Level : \(Upgrades.sharedupgrades.coinflipchance.1)")
        Levelxmultiplier.text = ("Level : \(Upgrades.sharedupgrades.coinflipmultiplier.1), Multiplier : \(Upgrades.sharedupgrades.coinflipmultiplier.0)")
    }
}
