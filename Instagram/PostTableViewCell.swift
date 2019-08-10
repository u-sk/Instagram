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
    
    // コメントした人の名前
//    @IBOutlet weak var commentPICLabel: UILabel!
    
    // 作成されたコメント    
    @IBOutlet weak var commentLabel: UILabel!
    
    //  コメント作成ボタン
    @IBOutlet weak var makeCommentButton: UIButton!

    
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
        
        // 文字サイズを一度0にする(nilの時にLabelが表示されるため)
        commentLabel.font = UIFont.systemFont(ofSize: 0)
         // コメント作成者・コメント追加
        if let poster = postData.poster, let comment = postData.comment {
             self.commentLabel.text = "\(poster)さんのコメント : \(comment)"
            // 文字サイズを復活
            commentLabel.font = UIFont.systemFont(ofSize: 15)
        }
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
