//
//  TeamViewCellSwift.swift
//  Master iOs
//
//  Created by admin on 11/1/2567 BE.
//

import Foundation
import UIKit

class TeamViewCellSwift:UITableViewCell {
	
	
	private func getBadgeView(teamId:TeamType) -> UIImageView? {
		let imageView =  UIImageView.init()
		if let badge = teamId.badge as? UIImage {
			imageView.image = badge
			imageView.contentMode = .center
			imageView.translatesAutoresizingMaskIntoConstraints = false
			return imageView
		}
		return nil
	}
	
	private func getInfoView(team:TeamSwift) -> UIView? {
		let wrapper =  UIStackView.init()
		wrapper.translatesAutoresizingMaskIntoConstraints = false
		wrapper.axis = .vertical
		wrapper.backgroundColor = .green
		
		let nameView = UILabel.init()
		nameView.text = team.name
		
		
		let infoView = UILabel.init()
		infoView.numberOfLines = 0
		infoView.text = team.info
		
		wrapper.addArrangedSubview(nameView)
		wrapper.addArrangedSubview(infoView)
		
		NSLayoutConstraint.activate([
			nameView.topAnchor.constraint(equalTo: wrapper.topAnchor),
			nameView.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor),
			
			infoView.topAnchor.constraint(equalTo: nameView.bottomAnchor,constant: 8),
			infoView.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor)
		])
		
		return wrapper
	}
	
	
	
	func configure(team:TeamSwift){
		guard let badgeView = getBadgeView(teamId: team.id) else {
			print("Can not find badge view for team \(team.id)")
			return
		}
		guard let infoView = getInfoView(team: team) else {
			print("Can not find info view for team \(team.id)")
			return
		}
		
		let containerView = UIStackView.init()
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.distribution = .fill
		containerView.axis = .horizontal
		
		
		containerView.addArrangedSubview(badgeView)
		containerView.addArrangedSubview(infoView)
		
		self.contentView.addSubview(containerView)
		
		NSLayoutConstraint.activate([
			containerView.topAnchor.constraint(equalTo: self.topAnchor,constant: 8 ),
			containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
			containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
			containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
			
			badgeView.topAnchor.constraint(equalTo: containerView.topAnchor),
			badgeView.widthAnchor.constraint(equalToConstant: 80),
			badgeView.heightAnchor.constraint(equalToConstant: 80),
			
			infoView.topAnchor.constraint(equalTo: badgeView.topAnchor),
			infoView.leadingAnchor.constraint(equalTo: badgeView.trailingAnchor),
		])
		
	}
	
	
}
