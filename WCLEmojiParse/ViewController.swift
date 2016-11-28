//
//  ViewController.swift
//  WCLEmojiParse
//
//  Created by 王崇磊 on 2016/11/28.
//  Copyright © 2016年 王崇磊. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emojiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let str = "我的哈哈[angry]，不错啊啊[beers][kiss]，我那时豆[腐脑]随时[都i搜[索v发阿斗屁啊[weary]波霸辩驳SD女哦死女OS[smirk]帝女搜女阿斗VB死DV巴豆VB搜VB阿迪女DOS"
        self.emojiLabel.attributedText = WCLEmojiParse.replaceEmoji(str)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

