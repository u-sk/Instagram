//
//  CommentViewController.swift
//  Instagram
//
//  Created by 板垣有祐 on 2019/08/06.
//  Copyright © 2019 Swift-Beginner. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {

    var X: PostData!
    
    @IBOutlet weak var editCommentTextField: UITextField!
    
    // 投稿ボタンを押したとき
    @IBAction func postCommentButton(_ sender: Any) {
        print(editCommentTextField.text!)
        
        // editCommentTextFieldからテキストを取得する
        let comment = editCommentTextField.text
        
        // 投稿者を取得
        let poster = Auth.auth().currentUser?.displayName
        
        // 辞書を作成してFirebaseに保存する(更新)
//        let postRef = Database.database().reference().child(Const.PostPath)
        let postRef = Database.database().reference().child(Const.PostPath).child(X.id!)
        let postCommentDic = ["comment": comment, "poster": poster!]
//        postRef.child("PostData.id").updateChildValues(postCommentDic)
        postRef.updateChildValues(postCommentDic)
        // HUDで投稿完了を表示するs
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    // キャンセルボタンを押したとき
    @IBAction func cancelCommentButtom(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
