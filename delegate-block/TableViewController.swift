//
//  TableViewController.swift
//  swfit demo
//
//  Created by 王 旭 on 2017/11/30.
//  Copyright © 2017年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	var dataArr : [tableViewCellModel]?;
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.dataArr = [];
		for i in 1...10 {
			print(i);
			let cellModel = tableViewCellModel();
			cellModel.number = i;
			cellModel.name = String(format:"这是%d",i);
			cellModel.age = 2.0;
			self.dataArr?.append(cellModel);
		}

		
		self.tableView.register(TableViewCell.classForCoder(), forCellReuseIdentifier: "cell");
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return (self.dataArr?.count)!;
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell;
		cell?.tableViewModel = self.dataArr?[indexPath.row];
        return cell!
    }
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60;
	}
}
