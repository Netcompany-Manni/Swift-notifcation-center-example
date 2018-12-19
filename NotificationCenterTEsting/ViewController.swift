//
//  ViewController.swift
//  NotificationCenterTEsting
//
//  Created by Manveer Singh Pandher on 19/12/2018.
//  Copyright © 2018 Manveer Singh Pandher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     @IBOutlet weak var outputLabel: UILabel!
    
        // 1. User clicks a button
    @IBAction func updateLabelButtonClicked(_ sender: Any) {
        // 2. Choose which data to send to NotificationCenter. Can even be text from a input field, or an object in the class.
        let tekst : String = "TestData"
        //3. name is the name of a "radioChannel" where observers can listen to. This is added as an extension at the bottom
        //Siste parameteret object er dataen vi vil sende. Kan være et tall, tekst, eller et helt objekt.
        NotificationCenter.default.post(name: .sendMessage, object: tekst)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //4. I viewDidLoad loader vi ønsket data.
        //Observeren er viewControlleren vi er i
        //Selector må skrives som det under, og krever referansen til en funksjon
        //Name krever hvilken "radiokanal" man ønsker å lytte på. Kan også skrive Notification.name.sendMessage
        //object er jeg usikker på hittil <-- TODO: Hva gjør den
        NotificationCenter.default.addObserver(self, selector: #selector(printSomething), name: .sendMessage, object: nil)
    }
    
    // 5. Notificationcenter på viewDidLoad går inn på denne metoden, og vi henter objektet eller dataen fra notificationcenter
    // Fordi vi lytter på kanalen, og får inn data fra valgt kanal. Den må skrives med @objc func methodName(notification : Notification)
    @objc func printSomething(notification : Notification){
        // 6. Vær klar over hva slags data som har blitt sendt til notificationCenteret. Default så er den ANY¨
        // Jeg vet tidligere at dataen på denne radiokanalen er en String, og derfor downcaster jeg den ned til en String
        // Dette kunne også vært et helt objekt, om ønskelig, men da må man sende med et helt objekt, på steg 2
        let testData = notification.object as! String
        // 7. Om ønskelig, sett dataen man har hentet fra Notificationcenteret til å bli displayet, eller gjør noe mer med det.
        outputLabel.text = testData
    }
   
}

extension Notification.Name{
    static let sendMessage = Notification.Name(rawValue: "RadioKanalEn")
}
