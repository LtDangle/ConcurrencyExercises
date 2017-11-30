//
//  ViewController.swift
//  ConcurrencyExercises
//
//  Created by C4Q on 11/30/17.
//  Copyright © 2017 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var countries = [Country]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        loadCountries()
    }
    
    func loadCountries() {
        let urlStr = "https://restcountries.eu/rest/v2/name/united"
        let setCountriesToOnlineCountries: ([Country]) -> Void = {(onlineCountries: [Country]) in
            self.countries = onlineCountries
        }
        CountryAPIClient.manager.getCountries(from: urlStr,
                                              completionHandler: setCountriesToOnlineCountries,
                                              errorHandler: {print($0)})
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryToUse = countries[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = countryToUse.name
        cell.populationLabel.text = String(countryToUse.population)
        cell.capitalLabel.text = countryToUse.capital
//        cell.textLabel?.text = countryToUse.name
//        cell.detailTextLabel?.text = String(countryToUse.population)
//        cell.imageView?.image = nil
//        let urlStr = "http://www.geognos.com/api/en/countries/flag/\(countryToUse.alpha2Code).png"
//        let setImageToOnlineImage: (UIImage) -> Void = {(onlineImage: UIImage) in
//            cell.imageView?.image = onlineImage
//            cell.setNeedsLayout()
//        }
//        ImageAPIClient.manager.loadImage(from: urlStr,
//                                         completionHandler: setImageToOnlineImage,
//                                         errorHandler: {print($0)})
        
        return cell
    }
}


