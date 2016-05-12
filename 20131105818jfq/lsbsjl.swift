//
//  lsbsjl.swift
//  20131105818jfq
//
//  Created by dou on 16/5/12.
//  Copyright © 2016年 stonepeak. All rights reserved.
//

import UIKit

class lsbsjl: UIViewController {
    var db:SQLiteDB!

    @IBOutlet weak var ls1: UITextField!
    @IBOutlet weak var ls2: UITextField!
    @IBOutlet weak var ls3: UITextField!
    @IBOutlet weak var ls4: UITextField!
    @IBOutlet weak var ls5: UITextField!
    @IBOutlet weak var ls6: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
    }
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            ls1.text = user["uname"] as? String
            ls2.text = user["mobile"] as? String
            let user2 = data[data.count - 2]
            ls3.text = user2["uname"] as? String
            ls4.text = user2["mobile"] as? String
            let user3 = data[data.count - 3]
            ls5.text = user3["uname"] as? String
            ls6.text = user3["mobile"] as? String
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
