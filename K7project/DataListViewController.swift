//
//  DataListViewController.swift
//  K7project
//
//  Created by Mihailo Jovanovic on 14.11.21..
//

import UIKit

class DataListViewController: UITableViewController, PersonProtocol {
    var selectedPersonAge: Int = 20 {
        didSet {
            var selectedPerson = personArray[number ?? 0]
            selectedPerson.age = selectedPersonAge
            personArray[number ?? 0] = selectedPerson
            tableView.reloadData()
        }
    }
    
    
    var number: Int?
    
    var personArray: [Person] = [
        Person(name: "Danilo", lastName: "Danilovic", age: 24, gender: Gender.male),
        Person(name: "Jovana", lastName: "Jovanovic", age: 25,gender: Gender.female),
        Person(name: "Marko", lastName: "Markovic", age: 26,gender: Gender.male)]
    
    var selectedSymbol: Person?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)

        cell.textLabel?.text = "\(personArray[indexPath.row].name) \(personArray[indexPath.row].lastName), \(personArray[indexPath.row].age)"

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSymbol = personArray[indexPath.row]
        number = indexPath.row
        performSegue(withIdentifier: "personDetailSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "personDetailSegue", let symbolDetailVC=segue.destination as? PersonViewController {
            symbolDetailVC.selectedSymbol = selectedSymbol
            symbolDetailVC.personDelegate = self
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
