//
//  TeamViewCellSwift.swift
//  Master iOs
//
//  Created by admin on 11/1/2567 BE.
//

import Foundation
import UIKit


protocol TeamViewCellSwiftDelegate: class {
	func onPressPlayButton(for team:TeamSwift)
}

// MARK: - PROPERTIES

class TeamViewCellSwift:UITableViewCell {
	
	static let cellId =  "TeamViewCellSwiftId"
	
	
	private var teamData : TeamSwift?
	private weak var delegate : TeamViewCellSwiftDelegate?
	
	private lazy var containerView:UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var badgeView:UIImageView =  {
		let imgView = UIImageView()
		imgView.contentMode = .scaleAspectFit
		imgView.translatesAutoresizingMaskIntoConstraints = false
		return imgView
	}()
	
	private lazy var infoWrapperView:UIStackView = {
		let stackVw = UIStackView()
		stackVw.translatesAutoresizingMaskIntoConstraints = false
		stackVw.axis = .vertical
		stackVw.spacing = 2
		return stackVw
	}()
	
	private lazy var nameView:UILabel = {
		let nameVw = UILabel()
		nameVw.translatesAutoresizingMaskIntoConstraints = false
		nameVw.numberOfLines = 0
		nameVw.textColor = .white
		nameVw.font = .systemFont(ofSize: 18)
		nameVw.font = .boldSystemFont(ofSize: 16)
		return nameVw
		
	}()
	
	private lazy var infoView:UILabel = {
		let infoVw = UILabel()
		infoVw.translatesAutoresizingMaskIntoConstraints = false
		infoVw.numberOfLines = 0
		infoVw.textColor = .white
		infoVw.font = .systemFont(ofSize: 18)
		infoVw.font = .boldSystemFont(ofSize: 16)
		return infoVw
		
	}()
	
	private lazy var managerView:UILabel = {
		let managerVw = UILabel()
		managerVw.translatesAutoresizingMaskIntoConstraints = false
		managerVw.numberOfLines = 0
		managerVw.textColor = .lightText
		managerVw.font = .systemFont(ofSize: 18)
		managerVw.font = .boldSystemFont(ofSize: 16)
		return managerVw
		
	}()
	private lazy var foundedView:UILabel = {
		let foundedVw = UILabel()
		foundedVw.translatesAutoresizingMaskIntoConstraints = false
		foundedVw.numberOfLines = 0
		foundedVw.textColor = .lightText
		foundedVw.font = .systemFont(ofSize: 18)
		foundedVw.font = .boldSystemFont(ofSize: 16)
		return foundedVw
		
	}()
	
	private lazy var buttonView:UIButton = {
		let btnView = UIButton()
		btnView.translatesAutoresizingMaskIntoConstraints = false
		btnView.tintColor = .white
		btnView.imageView?.contentMode = .center
		return btnView
	}()
	
	// MARK: - add clean up function when the cell is off the screen
	override func prepareForReuse() {
		super.prepareForReuse()
		self.delegate = nil
		self.teamData = nil
		self.contentView.subviews.forEach{
			$0.removeFromSuperview()
		}
	}
	
}

// MARK: - SET UP UI

extension TeamViewCellSwift {
	
	func configure(team:TeamSwift, delegate:TeamViewCellSwiftDelegate){
		
		self.teamData = team
		self.delegate = delegate

		badgeView.image = team.id.badge
		
		nameView.text = team.name
		infoView.text = team.info
		managerView.text = team.manager.name
		foundedView.text = team.founded
		
		buttonView.setImage(team.isPlaying ? Assets.pause : Assets.play, for: .normal)
		buttonView.addTarget(self, action: #selector(onPressPlayButtonHandler), for: .touchUpInside)
		
		containerView.backgroundColor = team.id.background
		containerView.layer.cornerRadius = 8
		
		self.contentView.addSubview(containerView)
		
		containerView.addSubview(badgeView)
		containerView.addSubview(infoWrapperView)
		containerView.addSubview(buttonView)
		
		infoWrapperView.addArrangedSubview(nameView)
		infoWrapperView.addArrangedSubview(managerView)
		infoWrapperView.addArrangedSubview(foundedView)
		infoWrapperView.addArrangedSubview(infoView)
		
		NSLayoutConstraint.activate([
			containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 8 ),
			containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -8),
			containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 8),
			containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -8),
			
			badgeView.topAnchor.constraint(equalTo: infoWrapperView.topAnchor),
			badgeView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
			badgeView.widthAnchor.constraint(equalToConstant: 50),
			badgeView.heightAnchor.constraint(equalToConstant: 50),
			
			infoWrapperView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 16),
			infoWrapperView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -16),
			infoWrapperView.leadingAnchor.constraint(equalTo: badgeView.trailingAnchor,constant: 8),
			infoWrapperView.trailingAnchor.constraint(equalTo: buttonView.leadingAnchor, constant: -8),
			
			buttonView.widthAnchor.constraint(equalToConstant: 44),
			buttonView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -16),
			buttonView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
			buttonView.topAnchor.constraint(equalTo: containerView.topAnchor),
		])
		
	}
}

// MARK: - IMPLEMENT DELEGATE

extension TeamViewCellSwift {
	@objc func onPressPlayButtonHandler(){
		print("On Press Play Button \(teamData?.name)")
		if(teamData != nil){
			self.delegate?.onPressPlayButton(for: teamData!)
		}
	}
	
}
