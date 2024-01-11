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
		let imageView =  UIImageView()
		if let badge = teamId.badge as? UIImage {
			imageView.image = badge
			imageView.contentMode = .scaleAspectFit
			imageView.translatesAutoresizingMaskIntoConstraints = false
			return imageView
		}
		return nil
	}
	
	private func getInfoView(team:TeamSwift) -> UIView? {
		let wrapper =  UIStackView()
		wrapper.translatesAutoresizingMaskIntoConstraints = false
        wrapper.spacing = 4
		wrapper.axis = .vertical
		
		let nameView = UILabel()
        nameView.translatesAutoresizingMaskIntoConstraints = false
		nameView.text = team.name
        nameView.numberOfLines = 0
        nameView.font = .systemFont(ofSize: 18)
        nameView.font = .boldSystemFont(ofSize: 16)
		
		
		let infoView = UILabel()
        infoView.translatesAutoresizingMaskIntoConstraints = false
		infoView.numberOfLines = 0
		infoView.text = team.info
		
		wrapper.addArrangedSubview(nameView)
		wrapper.addArrangedSubview(infoView)
		
//		NSLayoutConstraint.activate([
//			nameView.topAnchor.constraint(equalTo: wrapper.topAnchor),
//			nameView.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor),
//
//			infoView.topAnchor.constraint(equalTo: nameView.bottomAnchor,constant: 16),
//            infoView.leadingAnchor.constraint(equalTo: wrapper.leadingAnchor),
//		])
		
		return wrapper
	}
    
    private func getControlButton(team: TeamSwift) -> UIButton {
        let button = UIButton()
        button.setImage(team.isPlaying ? Assets.pause : Assets.pause, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
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
        let buttonView = getControlButton(team: team)
		
		let containerView = UIStackView.init()
        
        containerView.backgroundColor = team.id.background
		containerView.translatesAutoresizingMaskIntoConstraints = false
		containerView.distribution = .fill
		containerView.axis = .horizontal
        containerView.layer.cornerRadius = 8
		
		
		containerView.addArrangedSubview(badgeView)
        containerView.addArrangedSubview(infoView)
		containerView.addArrangedSubview(buttonView)
		
		self.contentView.addSubview(containerView)
		
		NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 8 ),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 16),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -16),
			
			badgeView.topAnchor.constraint(equalTo: infoView.topAnchor),
            badgeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
			badgeView.widthAnchor.constraint(equalToConstant: 80),
            badgeView.heightAnchor.constraint(equalToConstant: 80),
			
			infoView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 16),
            infoView.leadingAnchor.constraint(equalTo: badgeView.trailingAnchor,constant: 8),
            infoView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -16),
            infoView.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: -8),
            
            buttonView.heightAnchor.constraint(equalToConstant: 44),
            buttonView.widthAnchor.constraint(equalToConstant: 44),
            buttonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16)
		])
		
	}
	
	
}
