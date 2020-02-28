//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Barnham, Samuel (ABH) on 29/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()

    fileprivate func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedDivision = divisions[indexPath.row]
        var absence = Absence(date: currentDate, present: selectedDivision.students)
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }

        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            if let absence = division.getAbsence(for: self.currentDate) {
                absence.present = division.students
            } else {
                let absence = Absence(date: self.currentDate, present: division.students)
                division.absences.append(absence)
            }
            tableView.reloadData()
            completionHandler(true)
        }
        allPresent.backgroundColor = UIColor.green
        return UISwipeActionsConfiguration(actions: [allPresent])
    }
    
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let clear  = UIContextualAction(style: .normal, title: "Clear") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            let index = division.absences.firstIndex(where: { $0.takenOn == self.currentDate })
            division.absences[index ?? 0] = Absence(date: self.currentDate, present: division.students)
            let cell = tableView.cellForRow(at: indexPath)
            cell!.accessoryType = .none
            completionHandler(true)
        }
        clear.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [clear])
    }
    
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
        tableView.reloadData()
    }
    
    
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
        tableView.reloadData()
    }
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        cell.accessoryType = .none
        cell.textLabel?.text = divisions[indexPath.row].code
        for absence in divisions[indexPath.row].absences {
            if absence.takenOn == currentDate {
                cell.accessoryType = .checkmark
            }
        }
        return cell
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "CY-1", of: 6))
        divisions.append(DivisionFactory.createDivision(code: "CZ-2", of: 4))
        divisions.append(DivisionFactory.createDivision(code: "DB-4", of: 12))
        
    }


}

