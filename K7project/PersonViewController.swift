//
//  PersonViewController.swift
//  K7project
//
//  Created by Mihailo Jovanovic on 14.11.21..
//

import UIKit
protocol PersonProtocol: class {
    var selectedPersonAge: Int { get set }
}
class PersonViewController: UIViewController {
    
    
    weak var personDelegate: PersonProtocol?

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    var selectedSymbol: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navigationItem.rightBarButtonItem = 
        nameLabel.text = selectedSymbol?.name
        lastNameLabel.text = selectedSymbol?.lastName
        ageLabel.text = "\(selectedSymbol?.age ?? 20)"
        genderLabel.text = selectedSymbol?.gender.rawValue
    }
    
    @IBAction func addYearPressed(_ sender: Any) {
        if selectedSymbol!.age < 99 {
            selectedSymbol?.age += 1
            ageLabel.text = "\(selectedSymbol!.age)"}
    }
    @IBAction func removeYearPressed(_ sender: Any) {
        if selectedSymbol!.age < 99 {
            selectedSymbol?.age -= 1
            ageLabel.text = "\(selectedSymbol!.age)"
        }
    }
    @IBAction func cancelPressed(_ sender: Any) {
        personDelegate?.selectedPersonAge = selectedSymbol?.age ?? 20
        self.dismiss(animated: true, completion: nil)
    }
    
}
