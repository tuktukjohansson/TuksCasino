
import Foundation
import Foundation
class Upgrades {
    static let sharedupgrades = Upgrades()
    // Coinflip Upgrades \\
    var coinflipchance = (110.0, 1, 500.0)
    var coinflipmultiplier = (1.00, 1, 500.0)
    // Coinflip Upgrades \\
    
    // Crash Upgrades \\
    var crashmultiplier = (1.00, 1, 500.0)
    var crashonstart = (5.00, 1, 500.0)
    var crashbefore2 = (10.00, 1, 500.0)
    var crashbefore10 = (10.00, 1, 500.0)
    var maximumcrash = (15.00, 1, 500.0)
    // Crash Upgrades \\
}
