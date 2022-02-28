//
//  FlagDetailViewController.swift
//  FlagAppIOS
//
//  Created by Ankit Raj on 26/02/22.
//

import UIKit

class FlagDetailViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var continentLbl: UILabel!
    
    var flagURL = ""
    var country = ""
    var continent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: flagURL)!
        if let data = try? Data(contentsOf: url) {
            flagImage.image = UIImage(data: data)
        }
        
        countryLbl.text="Country- "+country
        continentLbl.text="Continent- "+continent
    }
}
