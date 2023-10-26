//
//  GameViewController.swift
//  Guess the animal
//
//  Created by Юрий Кручинин on 12/6/23.
//

import UIKit
import AVFoundation

final class GameViewController: UIViewController {
    
    private var soundsModel = SoundsModel()
    
    private let animals = ["cat", "dog", "fox", "tiger", "crocodile", "rat", "pig"]
    
    @IBOutlet private weak var soundOnButton: UIButton!
    
    @IBOutlet private weak var soundOffButton: UIButton!
    
    @IBOutlet weak private var animalImage: UIImageView!
    
    private var previousAnimal: String?
    
    @IBOutlet private weak var firstButton: UIButton!
    
    @IBOutlet private weak var secondButton: UIButton!
    
    @IBOutlet private weak var thirdButton: UIButton!
    
    @IBOutlet private weak var fourthButton: UIButton!
    
    override func viewDidLoad() {
        
        soundOnButton.titleLabel?.text = nil
        soundOffButton.titleLabel?.text = nil
        
        updateButtonTitles()
        checkForMatching()
        soundOffButton.isHidden = true
    
    }
        
        private func updateButtonTitles() {
            firstButton.setTitle(animals.randomElement()!, for: .normal)
            secondButton.setTitle(animals.randomElement()!, for: .normal)
            thirdButton.setTitle(animals.randomElement()!, for: .normal)
            fourthButton.setTitle(animals.randomElement()!, for: .normal)
            
            var randomAnimalName = animals.randomElement()!
            if randomAnimalName == previousAnimal {
                repeat {
                    randomAnimalName = animals.randomElement()!
                } while randomAnimalName == previousAnimal
            }
                animalImage.image = UIImage(named: randomAnimalName)
                animalImage.accessibilityIdentifier = randomAnimalName
                previousAnimal = animalImage.accessibilityIdentifier
            
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
    
   private func checkForMatching() {

        while firstButton.currentTitle != animalImage.accessibilityIdentifier && secondButton.currentTitle != animalImage.accessibilityIdentifier && thirdButton.currentTitle != animalImage.accessibilityIdentifier && fourthButton.currentTitle != animalImage.accessibilityIdentifier {
            updateButtonTitles()
        }
    }
    
   private func flashButton(_ button: UIButton) {
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
    
    @IBAction private func firstButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            updateButtonTitles()
            checkForMatching()
                soundsModel.playSoundRight()
        } else {
            DispatchQueue.main.async {
                self.flashButton(sender)
            }
            soundsModel.playSoundWrong()
        }
        
    }
    
    @IBAction private func secondButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            DispatchQueue.main.async {
                self.flashButton(sender)
            }
            soundsModel.playSoundWrong()
        }
        
    }
    
    @IBAction private func thirdButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            DispatchQueue.main.async {
                self.flashButton(sender)
            }
            soundsModel.playSoundWrong()
        }
        
    }
    
    
    @IBAction private func fourthButtonPressed(_ sender: UIButton) {
        
        if sender.currentTitle == animalImage.accessibilityIdentifier {
            updateButtonTitles()
            checkForMatching()
            soundsModel.playSoundRight()
        } else {
            DispatchQueue.main.async {
                self.flashButton(sender)
            }
            soundsModel.playSoundWrong()
        }
        
    }
    
    @IBAction private func soundOnButtonPressed(_ sender: UIButton) {
        
        soundsModel.isSoundOn = true
        soundsModel.disableSound()
        updateSoundButtons()
        
    }
    
    @IBAction private func soundOffButtonPressed(_ sender: UIButton) {
        
        soundsModel.isSoundOn = false
        soundsModel.enableSound()
        updateSoundButtons()
        
    }
    
    private func updateSoundButtons() {
        soundOnButton.isHidden = soundsModel.isSoundOn
        soundOffButton.isHidden = !soundsModel.isSoundOn
        }
    
}
