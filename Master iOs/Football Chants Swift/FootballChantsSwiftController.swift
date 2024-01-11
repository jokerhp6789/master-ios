//
//  FootballChantsSwiftController.swift
//  Master iOs
//
//  Created by admin on 11/1/2567 BE.
//

import Foundation
import UIKit


class FootballChantsSwiftController:UIViewController {
	
	// MARK - DATA
	
	private lazy var teamData = TeamsViewModelSwift.init().teams
	
	// MARK - UI
	private lazy var tableView:UITableView = {
		let tv = UITableView()
		tv.translatesAutoresizingMaskIntoConstraints = false
		tv.backgroundColor = .clear
		tv.rowHeight = UITableView.automaticDimension
		tv.estimatedRowHeight = 44
		tv.separatorStyle = .none
		tv.register(TeamViewCellSwift.self, forCellReuseIdentifier: "Cell")
		return tv
	}()
	
	// MARK - Lifecycle
	
	override func  loadView() {
		super.loadView()
		setUp()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
}


// MARK - SET UP UI
private extension FootballChantsSwiftController {
	
	func setUp(){
		
		tableView.dataSource = self
		
		self.view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
}

// MARK - IMPLEMENT UITableViewDataSource
extension FootballChantsSwiftController:UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return teamData.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TeamViewCellSwift
		let foundTeam = teamData[indexPath.row]
		print("Found team item is \(foundTeam)")
		cell.configure(team: foundTeam)
		return cell
	}
	
	
	
}
