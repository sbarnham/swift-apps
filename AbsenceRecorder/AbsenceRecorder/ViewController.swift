//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Barnham, Samuel (ABH) on 29/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
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
        for division in divisions {
            print(division.code)
            print(division.students.count)
            for student in division.students {
                print("Forename: \(student.forename), Surname: \(student.surname)  Birthday: \(student.birthday)")
            }
        }
        
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController")
            as? DivisionAbsenceViewController else {
                fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        let selectedDivision = divisions[indexPath.row]
        
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            vc.absence = existingAbsence
        } else {
            let newAbsence = Absence(date: currentDate)
            selectedDivision.absences.append(newAbsence)
            vc.absence = newAbsence
        }
        
        vc.division = selectedDivision
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
        return cell
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "CY-1", of: 6))
        divisions.append(DivisionFactory.createDivision(code: "CZ-2", of: 4))
        divisions.append(DivisionFactory.createDivision(code: "DB-4", of: 12))
        
    }


}

