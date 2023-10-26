//
//  GameViewControllerUITests.swift
//  GameViewControllerUITests
//
//  Created by Юрий Кручинин on 2/10/23.
//

import XCTest
@testable import Guess_the_animal

final class GameViewControllerUITests: XCTestCase {

    func testForAnimalImageExistence() throws {
        // Given
        let app = XCUIApplication()
        let initialImage = app.images.element
        // When
        app.launch()
        //then
        XCTAssert(initialImage.exists)
    }
    
    func testForButtonsExisctence() throws {
        //Given
        let app = XCUIApplication()
        let buttonOne = app.buttons["buttonOne"]
        let buttonTwo = app.buttons["buttonTwo"]
        let buttonThree = app.buttons["buttonThree"]
        let buttonFour = app.buttons["buttonFour"]
        let buttonSoundOn = app.buttons["SoundOn"]
        let buttonSoundOff = app.buttons["SoundOff"]
        //When
        app.launch()
        //Then
        XCTAssert(buttonOne.exists)
        XCTAssert(buttonTwo.exists)
        XCTAssert(buttonThree.exists)
        XCTAssert(buttonFour.exists)
        XCTAssert(buttonSoundOn.exists)
        buttonSoundOn.tap()
        XCTAssert(buttonSoundOff.exists)
    }
    
    func testIfSounOnButtonIsEnable() throws {
        //given
        let app = XCUIApplication()
        let buttonSoundOn = app.buttons["SoundOn"]
        //when
        app.launch()
        //then
        XCTAssert(buttonSoundOn.isEnabled)
    }
    
    func testIfSounOffButtonIsEnable() throws {
        //given
        let app = XCUIApplication()
        let buttonSoundOn = app.buttons["SoundOn"]
        let buttonSoundOff = app.buttons["SoundOff"]
        //when
        app.launch()
        buttonSoundOn.tap()
        //then
        XCTAssert(buttonSoundOff.isEnabled)
    }
    
}
