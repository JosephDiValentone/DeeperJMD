//
//  MasterViewController.swift
//  DeeperJMD
//
//  Created by Joseph Divalentone on 3/18/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    // call the files that I am going to put into the app
    var MovieDM = MovieDataModel()
    let DataC = dataController()
    // using those files to grab the json data
    func GetIt() {
        DataC.getData { (data, error) in
            //loading the data
            self.MovieDM = data
            DispatchQueue.main.asyc{
                self.tableView.reloadData()
            }
            
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // go get the data from the datacontroller that gets it and puts it through the model
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
           
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return MovieDM.franchises.count// returns the number of franchises in the json
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return MovieDM.franchises[section].entries.count // return the number of franchise sections in the json
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = MovieDM.franchises[indexPath.section].entries[indexPath.row].name
        //grab cells that have populated and populate them with the data
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



