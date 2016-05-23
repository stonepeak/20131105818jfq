//
//  ViewController.swift
//  20131105818jfq
//
//  Created by dou on 16/4/18.
//  Copyright © 2016年 stonepeak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var db:SQLiteDB!
    var time : NSTimer!
    var timem : NSTimer!
    var timer:Int = 0
    var timer24:Int = 23
    @IBOutlet weak var k1: UITextField!
    @IBOutlet weak var k2: UITextField!
    @IBOutlet weak var save1: UITextField!
    @IBOutlet weak var save2: UITextField!
    @IBOutlet weak var save4: UITextField!
    @IBOutlet weak var save5: UITextField!
    @IBOutlet weak var save6: UITextField!
    @IBOutlet weak var save7: UITextField!
    @IBOutlet weak var save8: UITextField!
    @IBOutlet weak var save3: UITextField!
    var n1: String = ""
    var n2: String = ""
    var operand1: String = ""
    var operand2: String = ""
    var result1 = 0
    var result2 = 0

    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var time24: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,uname varchar(20),mobile varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            k1.text = user["uname"] as? String
            
            k2.text = user["mobile"] as? String
            
            
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let uname = self.k1.text!
        let mobile = self.k2.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(uname,mobile) values('\(uname)','\(mobile)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func start(sender: UIButton) {
        time = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector:Selector("tickDown"),userInfo:nil,repeats:true)
    }
    @IBAction func start24(sender: UIButton) {
            timem = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector:Selector("tickDown24"),userInfo:nil,repeats:true)
        
    }
    func tickDown()
    {
        timer++
        let sec = timer%60
        let min = timer/60
        time1.text = String(min)
        time2.text = String(sec)
        //saveUser()
        
    }
    func tickDown24()
    {
        if(timer24>=0)
        {
            time24.text = String(timer24)
            timer24--;
            
        }
        else
        {
            timer24=23;
        }
    }
    @IBAction func stop24(sender: UIButton) {
        timer24=23;
    }
    @IBAction func stop(sender: UIButton) {
        time.invalidate()
        
        //saveUser()
    }
    @IBAction func vs(sender: UIButton) {
        let value = sender.currentTitle!
        if value == "AC" {
            n1 = ""
            n2 = ""
            k1.text = ""
            k2.text = ""
            result1 = 0
            result2 = 0
            return
        } else if value == "A+1"||value == "A+2"||value == "A+3"{
            operand1 = value
          
            switch operand1{
            case "A+1":
                result1 =  result1 + 1

                k1.text = "\(result1)"
            case "A+2":
                result1 =  result1 + 2
                k1.text = "\(result1)"
            case "A+3":
                result1 =  result1 + 3
                k1.text = "\(result1)"
            default:
                result1 = 0
                
            }
            
        }else if value == "B+1"||value == "B+2"||value == "B+3"{
            operand2 = value
            
            switch operand2{
            case "B+1":
                result2 =  result2 + 1
                
                k2.text = "\(result2)"
            case "B+2":
                result2 =  result2 + 2
                k2.text = "\(result2)"
            case "B+3":
                result2 =  result2 + 3
                k2.text = "\(result2)"
            default:
                result2 = 0
                
            }
        }else if value == "<=1"||value == "<=2"||value == "<=3"||value == "<=4"{
                operand2 = value
                
                switch operand2{
                case "<=1":
                    save1.text = "\(result1)"
                    save2.text = "\(result2)"
                case "<=2":
                    save3.text = "\(result1)"
                    save4.text = "\(result2)"
                case "<=3":
                    save5.text = "\(result1)"
                    save6.text = "\(result2)"
                case "<=4":
                    save7.text = "\(result1)"
                    save8.text = "\(result2)"
                default:
                    result2 = 0
                    
                }

            
            
        }
   
        
    }


}

