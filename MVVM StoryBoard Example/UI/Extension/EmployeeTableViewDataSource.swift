//
//  EmployeeTableViewDataSource.swift
//  MVVM StoryBoard Example
//
//  Created by Paulo Antonelli on 04/10/22.
//

import Foundation
import UIKit

class EmployeeTableViewDataSource<Cell: UITableViewCell, T>: NSObject, UITableViewDataSource {
    private var cellIdentifier: String!
    private var items: Array<T>!
    var configureCell: (Cell, T) -> () = { _,_ in }
    
    init(cellIdentifier: String, items: Array<T>, configureCell: @escaping (Cell, T) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items =  items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        let item = items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
}
