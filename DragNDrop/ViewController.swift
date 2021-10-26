//
//  ViewController.swift
//  DragNDrop
//
//  Created by Aldino Efendi on 2021/10/25.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var questionView: UIView!
	@IBOutlet weak var answerView: UIView!
	@IBOutlet weak var answer2View: UIView!
	
	var panGesture = UIPanGestureRecognizer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		panGesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
		answerView.isUserInteractionEnabled = true
		answerView.addGestureRecognizer(panGesture)
	}
	
	@objc func draggedView(_ sender: UIPanGestureRecognizer){
		self.view.bringSubviewToFront(answerView)
		let translation = sender.translation(in: self.view)
		answerView.center = CGPoint(x: answerView.center.x + translation.x, y: answerView.center.y + translation.y)
		sender.setTranslation(CGPoint.zero, in: self.view)
		
		switch sender.state {
			case .ended:
				if !answerView.frame.intersects(questionView.frame) {
					answerView.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
				} else {
					answerView.alpha = 0
					questionView.backgroundColor = .red
				}
			
			default: break
		}
		
	}
}

