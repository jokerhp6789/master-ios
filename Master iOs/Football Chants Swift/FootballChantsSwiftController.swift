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
	
    private  var teamData = TeamsViewModelSwift()
	
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
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
        setUp()
	}
	
}


// MARK - SET UP UI
private extension FootballChantsSwiftController {
	func setUp(){
        
//        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
		
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
        return teamData.teams.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TeamViewCellSwift
        let foundTeam = teamData.teams[indexPath.row]
		print("Found team item is \(foundTeam)")
		cell.configure(team: foundTeam)
		return cell
	}
}

extension FootballChantsSwiftController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
