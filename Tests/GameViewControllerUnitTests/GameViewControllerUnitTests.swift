//
//  GameViewControllerUnitTests.swift
//  GameViewControllerUnitTests
//
//  Created by Юрий Кручинин on 2/10/23.
//

import XCTest
@testable import Guess_the_animal

final class GameViewControllerUnitTests: XCTestCase {

    var sut: GameViewController!
    
    override func setUpWithError() throws {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            sut = storyboard.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
            sut.loadViewIfNeeded() 
        }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testButtonsTitlesUniversality() throws {

        //given
        let firstButtonTitle = sut.firstButton.currentTitle!
        let secondButtonTitle = sut.secondButton.currentTitle!
        let thirdButtonTitle = sut.thirdButton.currentTitle!
        let fourthButtonTitle = sut.fourthButton.currentTitle!
        //when
        sut.updateButtonTitles()
        //than
        XCTAssertNotEqual(firstButtonTitle, secondButtonTitle)
        XCTAssertNotEqual(firstButtonTitle, secondButtonTitle)
        XCTAssertNotEqual(firstButtonTitle, thirdButtonTitle)
        XCTAssertNotEqual(firstButtonTitle, fourthButtonTitle)
        
        XCTAssertNotEqual(secondButtonTitle, thirdButtonTitle)
        XCTAssertNotEqual(secondButtonTitle, fourthButtonTitle)
        
        XCTAssertNotEqual(thirdButtonTitle, fourthButtonTitle)

    }
    
    func testForNoMatchingButtonsTitlesAndAnimalName() throws {
        
        //given
        let firstButtonTitle = sut.firstButton.currentTitle!
        let secondButtonTitle = sut.secondButton.currentTitle!
        let thirdButtonTitle = sut.thirdButton.currentTitle!
        let fourthButtonTitle = sut.fourthButton.currentTitle!
        let arrayOfTitles = [firstButtonTitle, secondButtonTitle, thirdButtonTitle, fourthButtonTitle]
        let animalName = sut.animalImage.accessibilityIdentifier!
        var expectation: Bool
        //when
        sut.checkForMatching()
        expectation = animalName == firstButtonTitle ||
        animalName == secondButtonTitle ||
        animalName == thirdButtonTitle ||
        animalName == fourthButtonTitle
        //than
        XCTAssert(expectation)
    }

}
