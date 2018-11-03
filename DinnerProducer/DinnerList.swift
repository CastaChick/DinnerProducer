//
//  DinnerList.swift
//  DinnerProducer
//
//  Created by Taichi Kasai on 2018/10/19.
//  Copyright © 2018 Taichi Kasai. All rights reserved.
//

import Foundation

struct Dinner {
    let name: String
    let point: Array<Float>
    
    var cost: Float {
        return self.point[0]
    }
    var mood: Float {
        return self.point[1]
    }
    var taste: Float {
        return self.point[2]
    }
    var alchol: Float {
        return self.point[3]
    }
}

let gyudon = Dinner(name: "牛丼", point: [1, 1, 3, 0])
let french = Dinner(name: "フレンチ", point: [5, 5, 3, 3])
let italian = Dinner(name: "イタリアン", point: [4, 4, 4, 3])
let wasyoku = Dinner(name: "和食", point: [5, 4, 1, 2])
let ramen = Dinner(name: "ラーメン", point: [2, 1, 5, 1])
let chinese = Dinner(name: "中華", point: [3, 3, 5, 2])
let fastFood = Dinner(name: "ファストフード", point: [1, 1, 5, 0])
let izakaya = Dinner(name: "居酒屋", point: [3, 2, 4, 3])

let dinnerList = [gyudon, french, italian, wasyoku, ramen, chinese, fastFood, izakaya]





