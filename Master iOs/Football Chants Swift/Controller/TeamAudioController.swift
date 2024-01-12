//
//  TeamAudioController.swift
//  Master iOs
//
//  Created by admin on 12/1/2567 BE.
//

import Foundation
import AVKit

class TeamAudioController {
	private var audioPlayer:AVAudioPlayer?
	
	func playAudio(with url:URL){
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: url)
			audioPlayer?.numberOfLoops = -1
			audioPlayer?.play()
		}catch {
			print(error)
		}
	}
	
	func playTeamChant (_ team:TeamSwift){
		if team.isPlaying{
			audioPlayer?.stop()
			return
		} else {
			guard let path = Bundle.main.path(forResource: "\(team.id.chantFile).mp3", ofType: nil) else {return}
			let url = URL(fileURLWithPath: path)
			playAudio(with: url)
		}
		
	}
	
}
