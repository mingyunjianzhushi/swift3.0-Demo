//
//  ViewController.swift
//  delegate-block
//
//  Created by 王 旭 on 2017/10/17.
//  Copyright © 2017年 com.org.shunshiwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController,TextViewControllerDelegate {
	
	var textField : UITextField?;

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let notificationBtn = UIButton(type:.custom);
		notificationBtn.frame = CGRect(x:80,y:90,width:100,height:30);
		notificationBtn.setTitle("跳转页面", for: .normal);
		notificationBtn.backgroundColor = UIColor.blue
		notificationBtn.addTarget(self, action: #selector(nextBtnClick), for: .touchUpInside);
		view.addSubview(notificationBtn);
		self.navigationItem.title = "主页面"
		NotificationCenter.default.addObserver(self, selector: #selector(notificationClick(notification:)), name: NSNotification.Name(rawValue: "name"), object: nil)
		self.textFieldFunc();
	

	}
	
	func textFieldFunc(){
		textField = UITextField(frame:CGRect(x:10,y:200,width:200,height:30));
		self.textField?.borderStyle = .roundedRect;//全写 UITextBorderStyle.roundedRect
		self.view.addSubview(self.textField!);
		self.textField?.placeholder = "请输入用户名";
		self.textField?.textAlignment = .left;
		//清除按钮
		self.textField?.clearButtonMode = .always;
		self.textField?.returnKeyType = .done;
	
	}
	
	//获取delegate
	func appdeledate() {
		
				let appDelegate =	UIApplication.shared.delegate as! AppDelegate
		
				appDelegate.window?.rootViewController = TextViewController();
	}
	
	//数组
	func arrayMothod1() {
		var array : Array<String>
		array = Array();
		array.append("这是什么啊");
		array.append("这是")
		
		for item in array {
			print(item);
		}
		
		for i in 0...(array.count - 1){
			print(i );
		}
		
		let dict = ["name" : "key name","name2":"key name2","name3":"key name3"];
		for key in dict{
			print(key);
		}
		
	}
	
	//字符串demo
	func stringMothod1() {
		var a : String
		a = "这是什么啊";
		print(a);
		
		
		//推断类型
		let name = "酷走天涯";
		print(name);
		
		
		var name2 = "哈哈";
		name2 = name2 + "这是什么啊";
		
		let indexsss = name2.index(name2.startIndex, offsetBy: 3)
		
		//删除指定位置的
		name2.remove(at: indexsss);
		
		//		let indexsss2 = name2.index(name2.endIndex, offsetBy: 2);
		//		 let stringThird  = name2.substring(to: indexsss)
		//
		//		let index = name2.index(after: 1)
		//		name2.remove(at: index);
		//		print(name2);
		
	}
	
	//通过闭包回传值
	@objc func nextBtnClick(){
		
		let str = self.textField?.text;
		print(str!);
		
		let vc = TextViewController();
		vc.delegate = self;
		vc.myblock = { (message:String) -> Void in
			print(message);
		}
		
		
		vc.addBlock = { (message:String ,name:String) -> String in
			
			let re = message + name;
			return re;
		}
		
		vc.loadData { (resultArray, result) in
			print(resultArray);
			
			for a : String in resultArray{
				print(a);
			}
			
			print(result);
		}
		
		
		let sun = vc.captureValue2(sums: 10);
		print(sun);
		
	
		
		vc.navigationItem.title = "二级页面"
		self.navigationController?.pushViewController(vc, animated: true);
	}
	
	//通知回调
	@objc func notificationClick(notification:NSNotification){
		let userInfo = notification.userInfo;
		print(userInfo!["action"]!);
	}
	
	//delegate
	func delegateClick(text: String) {
		print("接收到数据"+text);
	}

}

