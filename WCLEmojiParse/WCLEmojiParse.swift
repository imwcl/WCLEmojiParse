//
//  WCLEmojiParse.swift
//  WCLEmojiParse
//
// **************************************************
// *                                  _____         *
// *         __  _  __     ___        \   /         *
// *         \ \/ \/ /    / __\       /  /          *
// *          \  _  /    | (__       /  /           *
// *           \/ \/      \___/     /  /__          *
// *                               /_____/          *
// *                                                *
// **************************************************
//  Github  :https://github.com/631106979
//  HomePage:https://imwcl.com
//  CSDN    :http://blog.csdn.net/wang631106979
//
//  Created by 王崇磊 on 16/9/14.
//  Copyright © 2016年 王崇磊. All rights reserved.
//
// @class WCLEmojiParse
// @abstract 解析表情的类
// @discussion 解析表情的类
//

import UIKit

struct WCLEmojiParse {
    
    //所有表情对应的字符串
    static let emotions = ["[angry]", "[beers]", "[blush]", "[bomb]", "[cool]", "[flushed]", "[grin]", "[gun]", "[heart]", "[heartseyes]", "[imp]", "[Joy]", "[kiss]", "[ok]", "[persevere]", "[pray]", "[punch]", "[scream]", "[shit]", "[skull]", "[sleeping]", "[smiley]", "[smirk]", "[sob]","[sweat]", "[thumbsup]", "[tongue]", "[unamused]", "[v]", "[weary]", "[wink]", "[yum]"]
    
    //String的格式
    static let textAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 16), NSForegroundColorAttributeName: UIColor.black]
    //正则表达式的格式
    static let pattern = "\\[+[a-z]+\\]"
    //表情的bounds
    static let attachmentBounds = CGRect.init(origin: CGPoint.init(x: 0, y: -5), size: CGSize.init(width: 24, height: 24))
    
    //MARK: Public Methods
    static func replaceEmoji(_ str: String) -> NSAttributedString {
        //转成NSString
        let originalNSString = str as NSString
        //通过str获得NSMutableAttributedString
        let attStr = NSMutableAttributedString.init(string: str, attributes: textAttributes)
        var regex: NSRegularExpression?
        do {
            regex = try NSRegularExpression.init(pattern: pattern, options: .caseInsensitive)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        //获取到匹配正则的数据
        if let matches = regex?.matches(in: str, options: .withoutAnchoringBounds, range: NSMakeRange(0,attStr.string.characters.count)) {
            if matches.count > 0 {
                //遍历符合的数据进行解析
                for i in 0..<matches.count {
                    let result = matches[matches.count-i-1]
                    let range = result.range
                    let emojiStr = originalNSString.substring(with: range)
                    //符合的数据是否为表情
                    if emotions.contains(emojiStr) {
                        if let image = UIImage.init(named: emojiStr) {
                            //创建一个NSTextAttachment
                            let attachment    = NSTextAttachment()
                            attachment.image  = image
                            attachment.bounds = attachmentBounds
                            //通过NSTextAttachment生成一个NSAttributedString
                            let rep = NSAttributedString(attachment: attachment)
                            //把表情于之前的字符串替换
                            attStr.replaceCharacters(in: range, with: rep)
                        }
                    }
                }
            }
        }
        return attStr
    }

}

