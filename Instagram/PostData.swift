//
//  PostData.swift
//  
//
//  Created by 板垣有祐 on 2019/08/05.
//

import UIKit
import Firebase

class PostData: NSObject {  
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
//    var poster: String?
     var poster: [String] = []
    // コメント追加
//    var comment: String?
    
    var comment: [String] = []
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: Any]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        
        self.name = valueDictionary["name"] as? String
        
        self.caption = valueDictionary["caption"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
   
        // 投稿者
        if let poster = valueDictionary["poster"] as? [String] {
            self.poster = poster
        }
        
//        self.poster = valueDictionary["poster"] as? String
        // コメント
        if let comment = valueDictionary["comment"] as? [String] {
            self.comment = comment
        }
        
//        self.comment= valueDictionary["comment"] as? String
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
    }
}
