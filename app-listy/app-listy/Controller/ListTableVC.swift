//
//  ListTableVC.swift
//  app-listy
//
//  Created by Alexandre Gravelle on 2018-11-11.
//  Copyright © 2018 Alexandre Gravelle. All rights reserved.
//

import UIKit

class ListTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getItemsImageArray().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "parallaxCell", for: indexPath) as? ParallaxCell else { return UITableViewCell() }
        
        cell.configureCell(withImage: DataService.instance.getItemsImageArray()[indexPath.row], andDescription: DataService.instance.getItemsNameArray()[indexPath.row])

        return cell
    }

}
