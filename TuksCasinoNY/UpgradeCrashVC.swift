
import Foundation
import UIKit
class UpgradeCrashVC: UIViewController {
    @IBOutlet weak var Balancelbl: UILabel!
    @IBOutlet weak var Multiplierlvllabel: UILabel!
    @IBOutlet weak var Crashstartlvllabel: UILabel!
    @IBOutlet weak var CrashBefore2lvllabel: UILabel!
    @IBOutlet weak var CrashBefore10lvllabel: UILabel!
    @IBOutlet weak var Maximumvaluelvllabel: UILabel!
    @IBOutlet weak var Multiplierpricelabel: UILabel!
    @IBOutlet weak var Crashstartpricelabel: UILabel!
    @IBOutlet weak var Crashbefore2pricelabel: UILabel!
    @IBOutlet weak var Crashbefore10pricelabel: UILabel!
    @IBOutlet weak var Maximumvaluepricelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showbalance()
        showpricelabel()
        showupgradeslabels()
    }
    @IBAction func Upgradebuttonmultiplier(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.crashmultiplier.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.crashmultiplier.2
            showbalance()
            Upgrades.sharedupgrades.crashmultiplier.0 = Upgrades.sharedupgrades.crashmultiplier.0 * 1.10
            Upgrades.sharedupgrades.crashmultiplier.1 = Upgrades.sharedupgrades.crashmultiplier.1 + 1
            Upgrades.sharedupgrades.crashmultiplier.2 = Upgrades.sharedupgrades.crashmultiplier.2 * 1.5
            showpricelabel()
            showupgradeslabels()
        }
        else{
            alertnomoney()
        }
    }
    @IBAction func Upgradebuttoncrashonstart(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.crashonstart.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.crashonstart.2
            showbalance()
            Upgrades.sharedupgrades.crashonstart.0 = Upgrades.sharedupgrades.crashonstart.0 * 1.25
            Upgrades.sharedupgrades.crashonstart.1 = Upgrades.sharedupgrades.crashonstart.1 + 1
            Upgrades.sharedupgrades.crashonstart.2 = Upgrades.sharedupgrades.crashonstart.2 * 1.5
            showpricelabel()
            showupgradeslabels()
        }
        else{
            alertnomoney()
        }
    }
    @IBAction func Upgradebuttoncrashbefore2(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.crashbefore2.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.crashbefore2.2
            showbalance()
            Upgrades.sharedupgrades.crashbefore2.0 = Upgrades.sharedupgrades.crashbefore2.0 * 1.10
            Upgrades.sharedupgrades.crashbefore2.1 = Upgrades.sharedupgrades.crashbefore2.1 + 1
            Upgrades.sharedupgrades.crashbefore2.2 = Upgrades.sharedupgrades.crashbefore2.2 * 1.5
            showpricelabel()
            showupgradeslabels()
        }
        else{
            alertnomoney()
        }
    }
    @IBAction func Upgradebuttoncrashbefore10(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.crashbefore10.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.crashbefore10.2
            showbalance()
            Upgrades.sharedupgrades.crashbefore10.0 = Upgrades.sharedupgrades.crashbefore10.0 * 1.10
            Upgrades.sharedupgrades.crashbefore10.1 = Upgrades.sharedupgrades.crashbefore10.1 + 1
            Upgrades.sharedupgrades.crashbefore10.2 = Upgrades.sharedupgrades.crashbefore10.2 * 1.5
            showpricelabel()
            showupgradeslabels()
        }
        else{
            alertnomoney()
        }
    }
    @IBAction func Upgradebuttonmaximumvalue(_ sender: Any) {
        if (Balance.sharedbalance.mybalance >= Upgrades.sharedupgrades.maximumcrash.2){
            Balance.sharedbalance.mybalance = Balance.sharedbalance.mybalance - Upgrades.sharedupgrades.maximumcrash.2
            showbalance()
            Upgrades.sharedupgrades.maximumcrash.0 = Upgrades.sharedupgrades.maximumcrash.0 * 1.15
            Upgrades.sharedupgrades.maximumcrash.1 = Upgrades.sharedupgrades.maximumcrash.1 + 1
            Upgrades.sharedupgrades.maximumcrash.2 = Upgrades.sharedupgrades.maximumcrash.2 * 1.5
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
        Multiplierpricelabel.text = ("Price : \(Upgrades.sharedupgrades.crashmultiplier.2) $")
        Crashstartpricelabel.text = ("Price : \(Upgrades.sharedupgrades.crashonstart.2) $")
        Crashbefore2pricelabel.text = ("Price : \(Upgrades.sharedupgrades.crashbefore2.2) $")
        Crashbefore10pricelabel.text = ("Price : \(Upgrades.sharedupgrades.crashbefore10.2) $")
        Maximumvaluepricelabel.text = ("Price : \(Upgrades.sharedupgrades.maximumcrash.2) $")
    }
    func showupgradeslabels(){
        Multiplierlvllabel.text = ("Level : \(Upgrades.sharedupgrades.crashmultiplier.1), Multiplier : \(Int(Upgrades.sharedupgrades.crashmultiplier.0))")
        Crashstartlvllabel.text = ("Level : \(Upgrades.sharedupgrades.crashonstart.1)")
        CrashBefore2lvllabel.text = ("Level : \(Upgrades.sharedupgrades.crashbefore2.1)")
        CrashBefore10lvllabel.text = ("Level : \(Upgrades.sharedupgrades.crashbefore10.1)")
        Maximumvaluelvllabel.text = ("Level : \(Upgrades.sharedupgrades.maximumcrash.1), Max Value : \(Int(Upgrades.sharedupgrades.maximumcrash.0))")
    }
}
