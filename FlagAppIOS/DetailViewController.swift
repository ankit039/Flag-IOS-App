//
//  DetailViewController.swift
//  FlagAppIOS
//
//  Created by Ankit Raj on 24/02/22.
//

import UIKit
import Kingfisher
import SwiftUI


class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var fetchData = FetchFlagListData()
    
    //set data to our table view
    var flagListSpaces = [FlagList]()
    {
        didSet
        {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var cellImg: UIImageView!
    @IBOutlet weak var cellLbl: UILabel!
    
    
    //to get data of the row is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row Selected- "+String(indexPath.row))
        
        //get the selected row data
        let flagURL = flagListSpaces[indexPath.row].countryInfo.flag
        let country = flagListSpaces[indexPath.row].country
        let continent = flagListSpaces[indexPath.row].continent
        
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: "FlagDetailViewController") as? FlagDetailViewController
        //viewController?.flagURL = UIImage(named: flagURL!)
        guard let flagUrl = flagURL else {return}
        viewController?.flagURL = flagUrl
        viewController?.country = country!
        viewController?.continent = continent!
        navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    //to get the count of tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagListSpaces.count
    }
    
    //to set data to output cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cellId")
        
        ///set image to our cell
        let url = URL(string: (self.flagListSpaces[indexPath.row].countryInfo.flag))
        
        /// loads image on runtime
        cell.imageView?.kf.setImage(with: url)
        
        /// loads image on button pressed
        //        if let data = try? Data(contentsOf: url!) {
        //            cell.imageView?.image = UIImage(data: data)
        //        }
        
        /// tried to set constraints of imageView
        //        let frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        //        cell.imageView?.frame.size.height = 5.0
        //        cell.imageView?.frame.size.width = 5.0
        //        cell.imageView?.contentMode = .scaleAspectFill
        
        ///set text to our cell
        cell.textLabel?.text = self.flagListSpaces[indexPath.row].country
        
        
        /*
         /// tried 2nd Solution
         
         let url = URL(string: (self.flagListSpaces[indexPath.row].countryInfo.flag))
         let cellImg : UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 45))
         if let data = try? Data(contentsOf: url!) {
         cellImg.image = UIImage(data: data)
         }
         cell.addSubview(cellImg)
         
         let label = UILabel()
         label.frame = CGRect(x: 1 , y: 0, width: 200, height: 45)
         label.backgroundColor = UIColor.orange
         label.textAlignment = .right
         label.text = self.flagListSpaces[indexPath.row].country
         label.sizeToFit()
         cell.addSubview(label)
         */
        
        /*
         /// tried 3rd solution
         
         let url = URL(string: (self.flagListSpaces[indexPath.row].countryInfo.flag))
         if let data = try? Data(contentsOf: url!), let image=UIImage(data: data){
         var body: UIView {
         HStack{
         Image(uiImage: image)
         Text("okkkkkkkk")
         }
         }
         cell.addSubview(body)
         return cell
         }else{
         return cell
         }
         */
        
        return cell
        
    }
    
    override func viewDidLoad() {
        fetchData.fetchData{flagListArray in self.flagListSpaces = flagListArray}
        super.viewDidLoad()
        
        tableview.delegate=self
        tableview.dataSource=self
    }
    
}
