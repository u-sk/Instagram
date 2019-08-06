//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by 板垣有祐 on 2019/08/05.
//  Copyright © 2019 Swift-Beginner. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var commentPICLabel: UILabel!
    
    @IBOutlet weak var commentTextView: UITextView!
    
    //  コメント作成ボタンを押した時
    @IBAction func commentButton(_ sender: Any) {
//        let commentViewController = self.storyboard
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // PostData オブジェクト (インスタンス) の内容をセル内に配置したイメージやキャプションラベルに反映させるため、 setPostData(_:)メソッドを定義します。
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        // コメント投稿ボタン追加
        
        
        // コメント作成者ラベル・コメント記入テキストフィールド追加
        self.commentPICLabel.text = "<\(postData.name!)さんのコメント＞"
        self.commentTextView.text = postData.comment
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
