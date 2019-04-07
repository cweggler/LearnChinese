//
//  ViewController.swift
//  LearnChinese
//
//  Created by Cara on 4/4/19.
//  Copyright © 2019 Cara. All rights reserved.
//

import UIKit
import AVFoundation

class TranslationViewController: UIViewController {

    @IBOutlet var chineseCharacter: UILabel!
    @IBOutlet var pinyin: UILabel!
    @IBOutlet var englishTranslation: UILabel!
    
    var char: Char?
    
    let synthesizer = AVSpeechSynthesizer()
    let chineseSpeaker = AVSpeechSynthesisVoice(language: "zh-HK")
    let englishSpeaker =
        AVSpeechSynthesisVoice(language: "en-US")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let char = char else { return }
        
        chineseCharacter.text = char.chineseCharacter
        pinyin.text = char.pinyin
        englishTranslation.text = char.englishTranslation
        
    }
    
    @IBAction func readChineseAloud(_ sender: UIBarButtonItem) {
        
        guard let char = char else { return }
        
        let audio = AVSpeechUtterance(string: char.chineseCharacter)
        audio.voice = chineseSpeaker
        synthesizer.speak(audio)
        
    }
    
    @IBAction func readEnglishAloud(_ sender: UIBarButtonItem) {
        guard let char = char else { return }
        
        let audio = AVSpeechUtterance(string: char.englishTranslation)
        audio.voice = englishSpeaker
        synthesizer.speak(audio)
    }
}

