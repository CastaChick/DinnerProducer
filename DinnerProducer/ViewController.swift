//
//  ViewController.swift
//  DinnerProducer
//
//  Created by Taichi Kasai on 2018/10/19.
//  Copyright © 2018 Taichi Kasai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func goBack(segue: UIStoryboardSegue){
        reset()
    }
    
    func reset() {
        alcholSwich.isOn = false
        costSlider.value = 3
        tasteSlider.value = 3
        partnerSegment.selectedSegmentIndex = 0
        usersLike = [0, 0, 0, 0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    var usersLike: Array<Float> = [0, 0, 0, 0]
    var dinnerSugestion = gyudon
    
    func makeUserLike() {
        if alcholSwich.isOn {
            usersLike[3] = 3
        }
        usersLike[0] = costSlider.value
        usersLike[2] = tasteSlider.value
        if partnerSegment.selectedSegmentIndex == 0{
            usersLike[1] = 1.5
        } else if partnerSegment.selectedSegmentIndex == 1 {
            usersLike[1] = 1.5
        } else if partnerSegment.selectedSegmentIndex == 2 {
            usersLike[1] = 4
        } else if partnerSegment.selectedSegmentIndex == 3 {
            usersLike[1] = 4
        } else if partnerSegment.selectedSegmentIndex == 4 {
            usersLike[1] = 2
        }
    }
    
    func calcAndMatchLike(_ like:Array<Float>) -> Dinner {
        var likeParameter: Float
        var minParameter: Float = 4 * 4 * 4
        var mostSuitableDinner = gyudon
        for menu in dinnerList {
            likeParameter = 0
            for i in 0..<4 {
                likeParameter += powf((usersLike[i] - menu.point[i]), 2)
            }
            print(menu.name, likeParameter)
            if likeParameter < minParameter {
                minParameter = likeParameter
                mostSuitableDinner = menu
            }
        }
        return mostSuitableDinner
    }
    
    @IBOutlet weak var alcholSwich: UISwitch!
    @IBOutlet weak var costSlider: UISlider!
    @IBOutlet weak var tasteSlider: UISlider!
    
    @IBOutlet weak var partnerSegment: UISegmentedControl!
    
    @IBAction func decisionMaked(_ sender: Any) {
        makeUserLike()
        dinnerSugestion = calcAndMatchLike(usersLike)
        print(usersLike)
        print(dinnerSugestion)
        upDateSugestionLabel()
    }
    
    func upDateSugestionLabel(){
        //指定したIDのSegueを初期化する。同時にパラメータを渡すことができる
        self.performSegue(withIdentifier: "mySegue", sender:dinnerSugestion.name)
    }
    //Segueの初期化を通知するメソッドをオーバーライドする。senderにはperformSegue()で渡した値が入る。
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mySegue" {
            let secondViewController = segue.destination as! SecondViewController
            secondViewController.sugestionText = sender as? String
        }
    }
    
}

