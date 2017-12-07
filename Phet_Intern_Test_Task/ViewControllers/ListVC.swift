//
//  ListVC.swift
//  Phet_Intern_Test_Task
//
//  Created by Tristan Neate on 12/6/17.
//  Copyright © 2017 Tristan Neate. All rights reserved.
//


/*
Use a table view to list the available simulations the user can select from


*/


import UIKit

class ListVC: UITableViewController {
    let CellIdentifier = "Cell Identifier"
    let SegueIdentifier = "ListToSimulation"
    
    
    //a list containing the title and url of the available simulations
    let simumations:[(title:String, url:String)] = [
        (title:"Circuit Construction Kit: DC", url:"https://phet.colorado.edu/sims/html/circuit-construction-kit-dc/latest/circuit-construction-kit-dc_en.html"),
        (title:"Capacitor Lab: Basics", url:"https://phet.colorado.edu/sims/html/capacitor-lab-basics/latest/capacitor-lab-basics_en.html"),
        (title:"Projectile Motion", url:"https://phet.colorado.edu/sims/html/projectile-motion/latest/projectile-motion_en.html"),
        (title:"Molecule Polarity", url:"https://phet.colorado.edu/sims/html/molecule-polarity/latest/molecule-polarity_en.html"),
        (title:"Pendulum Lab", url: "https://phet.colorado.edu/en/simulations/category/new")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Simulations"
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simumations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        cell.textLabel?.text = simumations[indexPath.row].title
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SegueIdentifier, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! SimulationVC
                destinationViewController.simulationInfo = simumations[indexPath.row]
            }
        }
    }
    

}
