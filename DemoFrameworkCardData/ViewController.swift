//
//  ViewController.swift
//  DemoFrameworkCardData
//
//  Created by Juda Escalera on 26/07/21.
//

import UIKit
import CardData

class ViewController: UIViewController, CallbackTransaction {
    
    //MARK:-Variables & Constants
    var delegate : CallbackTransaction!
    
    //MARK:- IBOutlets
    @IBOutlet weak var lbData: UILabel!
    @IBOutlet weak var btnAction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        setUpView()
        fillDataRequest()
    }
    
    //MARK:- Methods
    func completedTransaction(response: KashPayResponse) {
        print("== completedTransaction() ==")
        
        if (response.success) {
            lbData.textColor = .black
            lbData.text = "Transacción realizada con éxitoso! \nNúmero de autorización: \(response.authorizationNumber ?? "000")"
        } else {
            lbData.textColor = .red
            lbData.text = "Transacción NO realizada! \nError: \(response.errorMessage ?? "errorMessage")"
        }
    }
    
    private func setUpView() {
        btnAction.layer.borderWidth = 1
        btnAction.layer.cornerRadius = 10.0
    }
    
    private func fillDataRequest() {
        DataConfig.request.updateValue("testTomaz@gmail.com", forKey: CardDataConstants.HMUser)
        DataConfig.request.updateValue("5.00", forKey: CardDataConstants.HMAmmount)
        DataConfig.request.updateValue("19.4257265", forKey: CardDataConstants.HMLatitude)
        DataConfig.request.updateValue("99.1696627", forKey: CardDataConstants.HMLongitude)
    }

    //MARK:- Actions
    @IBAction func actionGoToCardData(_ sender: UIButton) {
        let frameworkBundle = Bundle(identifier: "com.credencial.CardData")
        let storyboard = UIStoryboard(name: "CardData", bundle: frameworkBundle)
        let initialVC = storyboard.instantiateViewController(withIdentifier: "CardData")
        DataConfig.callback = self
        initialVC.modalPresentationStyle = .fullScreen
        self.present(initialVC, animated: true, completion: nil)
    }
    
    
    
}

