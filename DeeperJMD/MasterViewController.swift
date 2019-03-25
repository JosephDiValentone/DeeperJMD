//
//  MasterViewController.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/18/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController {
    
    
    
var detailViewController: DetailViewController? = nil
    var MovieDM : MovieDataModel?{
        didSet{tableView.reloadData()}
    }
var DataCon = dataController()
    
    override func viewDidLoad() {
//        init(from:MOvieDM)
    super.viewDidLoad()

        // go get the data from the datacontroller that gets it and puts it through the model
        if let split = splitViewController {
            _ = split.viewControllers
            print("view did load")
        }
        DataCon.getData { (data) in
            //loading the data
            self.MovieDM = data
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
    }
    
   
    

    
  
    
//    override func viewWillAppear(_ animated: Bool) {
//        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
//        super.viewWillAppear(animated)
//    }
    override func viewDidAppear(_ animated: Bool){
        let nav = self.navigationController?.navigationBar
        
    
        nav?.barStyle = UIBarStyle.black
        nav?.tintColor = UIColor.yellow
        
 
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        

        let image = UIImage(named: "IRDBlogo")
        imageView.image = image
        
   
        navigationItem.titleView = imageView
    }
    
    
    
    
    // MARK: - Segues

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = tableView.indexPathForSelectedRow {
//                let object = MovieDM[Showfranchise.row] as! String
//                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return ( MovieDM?.franchises.count ) ?? 0 // returns the number of franchises in the json
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieDM?.franchises[section].entries.count ?? 0 // return the number of franchise sections in the json
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?  {
        return MovieDM?.franchises[section].franchiseName // returns the name of the franchise for the title
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = MovieDM?.franchises[indexPath.section].entries[indexPath.row].name
        //grab cells that have populated and populate them with the data
        return cell
    }

}
