//
//  GameViewController.swift
//  Guess the animal
//
//  Created by Юрий Кручинин on 12/6/23.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    var soundsModel = SoundsModel()
    
    let animals = ["cat", "dog", "fox", "tiger", "crocodile", "rat", "pig"]

    @IBOutlet weak var soundOnButton: UIButton!
    
    @IBOutlet weak var soundOffButton: UIButton!
    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var fourthButton: UIButton!
    
    override func viewDidLoad() {
        
        updateButtonTitles()
        checkForMatching()
        soundOffButton.isHidden = true
        
    }
        
        func updateButtonTitles() {
            firstButton.setTitle(animals.randomElement()!, for: .normal)
            secondButton.setTitle(animals.randomElement()!, for: .normal)
            thirdButton.setTitle(animals.randomElement()!, for: .normal)
            fourthButton.setTitle(animals.randomElement()!, for: .normal)
            
            let randomAnimalName = animals.randomElement()!
            
                animalImage.image = UIImage(named: randomAnimalName)
                animalImage.accessibilityIdentifier = randomAnimalName
            
            while secondButton.currentTitle == firstButton.currentTitle {
                secondButton.setTitle(animals.randomElement()!, for: .normal)
            }

            while thirdButton.currentTitle == firstButton.currentTitle || thirdButton.currentTitle == secondButton.currentTitle {
                thirdButton.setTitle(animals.randomElement()!, for: .normal)
            }

            while fourthButton.currentTitle == firstButton.currentTitle || fourthButton.currentTitle == secondButton.currentTitle || fourthButton.currentTitle == thirdButton.currentTitle {
                fourthButton.setTitle(animals.randomElement()!, for: .normal)
            }
        }
    
    func checkForMatching() {

        while firstButton.currentTitle != animalImage.accessibilityIdentifier && secondButton.currentTitle != animalImage.accessibilityIdentifier && thirdButton.currentTitle != animalImage.accessibilityIdentifier && fourthButton.currentTitle != animalImage.accessibilityIdentifier {
            updateButtonTitles()
        }
    }
    
    func flashButton(_ button: UIButton) {
        let flashOverlay = UIView(frame: button.bounds)
        flashOverlay.backgroundColor = UIColor.red
        flashOverlay.alpha = 0.0
        flashOverlay.tag = 999
        
        button.addSubview(flashOverlay)
        
        button.layer.cornerRadius = 10.0
        button.layer.masksToBounds = true
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: [.curveEaseInOut, .autoreverse], animations: {
            flashOverlay.alpha = 1.0
        }, completion: { _ in
            flashOverlay.removeFromSuperview()
        })
    }
    
    @IBAction func firstButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            animalImage.image = UIImage(named: animals.randomElement()!)
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            flashButton(sender)
            soundsModel.playSoundWrong()
        }
        
    }
    
    @IBAction func secondButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            animalImage.image = UIImage(named: animals.randomElement()!)
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            flashButton(sender)
            soundsModel.playSoundWrong()
        }
        
    }
    
    @IBAction func thirdButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            animalImage.image = UIImage(named: animals.randomElement()!)
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            flashButton(sender)
            soundsModel.playSoundWrong()
        }
        
    }
    
    
    @IBAction func fourthButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            animalImage.image = UIImage(named: animals.randomElement()!)
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            flashButton(sender)
            soundsModel.playSoundWrong()
        }
        
    }
    
    @IBAction func soundOnButtonPressed(_ sender: UIButton) {
        
        soundsModel.isSoundOn = true
        soundsModel.disableSound()
        updateSoundButtons()
        
    }
    
    @IBAction func soundOffButtonPressed(_ sender: UIButton) {
        
        soundsModel.isSoundOn = false
        soundsModel.enableSound()
        updateSoundButtons()
        
    }
    
    func updateSoundButtons() {
        soundOnButton.isHidden = soundsModel.isSoundOn
        soundOffButton.isHidden = !soundsModel.isSoundOn
        }
}
