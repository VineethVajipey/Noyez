//
//  ViewController.swift
//  Noyez
//
//  Created by Vineeth on 7/17/17.
//  Copyright © 2017 Vineeth. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?
var answer: Int?
var test = false
class PianoViewController: UIViewController {
    
    //TEST_ORIENTATION_CAHNGE
   
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            print("Landscape")
        } else {
            print("Portrait")
        }
    }
    
    //KEYZ
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c1s: UIButton!
    @IBOutlet weak var d1: UIButton!
    @IBOutlet weak var d1s: UIButton!
    @IBOutlet weak var e1: UIButton!
    @IBOutlet weak var f1: UIButton!
    @IBOutlet weak var f1s: UIButton!
    @IBOutlet weak var g1: UIButton!
    @IBOutlet weak var g1s: UIButton!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a1s: UIButton! 
    @IBOutlet weak var b1: UIButton!

    //BUTTONZ
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    //VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        repeatButton.isHidden = true
        resetColors()
        test = false
    }
    
    //MEMWARNING
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //RESETCOLORS
    func resetColors() {
        c1.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0, blue: 0, alpha: 0.2)
        c1s.backgroundColor = UIColor(colorLiteralRed: 0.298, green: 0.298, blue: 0.298, alpha: 1)
        d1.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0.5, blue: 0, alpha: 0.2)
        d1s.backgroundColor = UIColor(colorLiteralRed: 0.4, green: 0.4, blue: 0.4, alpha: 1)
        e1.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 1.0, blue: 0, alpha: 0.2)
        f1.backgroundColor = UIColor(colorLiteralRed: 0, green: 1.0, blue: 0, alpha: 0.2)
        f1s.backgroundColor = UIColor(colorLiteralRed: 0.498, green: 0.498, blue: 0.498, alpha: 1)
        g1.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 1, alpha: 0.2)
        g1s.backgroundColor = UIColor(colorLiteralRed: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        a1.backgroundColor = UIColor(colorLiteralRed: 0.5, green: 0, blue: 0.5, alpha: 0.2)
        a1s.backgroundColor = UIColor(colorLiteralRed: 0.702, green: 0.702, blue: 0.702, alpha: 1)
        b1.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0, blue: 1.0, alpha: 0.2)
    }
    
    /*
     The point is, that you click the triangle, and it will play a sound. Then you need to figure out where on the piano that sound would have came from. I made it so that every time you click the triangle a new sound will come, you cant keep listening to it yet. I will add that feature later. You need to guess, but the point is that this will help you learn where each sound comes from. I need to add borders to the keys. 
     you might also want to show the note on the key. looks ugly
 
 */
    
    //AUDIO
    func playSound(key: String) {
    guard let url = Bundle.main.url(forResource: key, withExtension: "wav") else {
        print("Could not find wav!")
        return
    }
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            player = sound
            sound.play()
        } catch {
    }
    }
    
    //RANDNUMGEN
    func randAnswGen(){
        answer = Int(arc4random_uniform(12))
    }
    
    //NOTEGEN
    func noteGen() -> String {
        let arrayNote: [String] = ["c1", "c1s", "d1", "d1s", "es", "f1", "f1s", "g1", "g1s", "a1", "a1s", "b1"]
        return arrayNote[answer!]
    }

    //PLAY
    @IBAction func playButtonTapped(_ sender: Any) {
        resetColors()
        playButton.isHidden = true
        repeatButton.isHidden = false
        randAnswGen()
        playSound(key: noteGen())
        test = true
    }
    
    //REPEAT
    @IBAction func repeatButtonTapped(_ sender: Any) {
        playSound(key: noteGen())
    }
    
    //NOYEZ
    @IBAction func keyTapped(_ sender: UIButton) {
       
        //TESTIFCORRECT
        if test == true {
            if sender.tag == answer {
                sender.backgroundColor = UIColor(colorLiteralRed: 0, green: 1.0, blue: 0, alpha: 0.8)
                sender.layer.borderWidth = 1
                sender.layer.borderColor = UIColor.lightGray.cgColor
                test = false
                repeatButton.isHidden = true
                playButton.isHidden = false
            }
            else {
                sender.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0, blue: 0, alpha: 0.8)
                sender.layer.borderWidth = 1
                sender.layer.borderColor = UIColor.lightGray.cgColor
            }
        }
        
        switch sender.tag {
        case 0:
            playSound(key: "c1")
        case 1:
            playSound(key: "c1s")
        case 2:
            playSound(key: "d1")
        case 3:
            playSound(key: "d1s")
        case 4:
            playSound(key: "e1")
        case 5:
            playSound(key: "f1")
        case 6:
            playSound(key: "f1s")
        case 7:
            playSound(key: "g1")
        case 8:
            playSound(key: "g1s")
        case 9:
            playSound(key: "a1")
        case 10:
            playSound(key: "a1s")
        case 11:
            playSound(key: "b1")
        default:
            playSound(key: "f1")
        }
        
        
    }
}
