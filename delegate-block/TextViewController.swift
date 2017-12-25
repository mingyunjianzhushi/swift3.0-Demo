//
//  TextViewController.swift
//  delegate-block
//
//  Created by 王 旭 on 2017/10/17.
//  Copyright © 2017年 com.org.shunshiwei. All rights reserved.
//

import UIKit

protocol TextViewControllerDelegate:NSObjectProtocol {
	func delegateClick(text:String)
}

//闭包函数，取别名
typealias addblock = (String,String) -> (String)

class TextViewController: UIViewController {
	
	weak var delegate:TextViewControllerDelegate?
	
	//闭包函数，未取别名
	var myblock	: ((_ name : String) -> Void)?;
	
	var addBlock : addblock?

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = UIColor.gray;
		self.creatUI();
		
		let testBlock = captureValue2(sums: 100)
		print(testBlock())
		print(testBlock())
		print(testBlock())
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func creatUI() {
		let blockBtn = UIButton(frame:CGRect(x:10,y:30 + 64,width:100,height:30));
		blockBtn.setTitle("闭包函数", for: .normal);
		blockBtn.backgroundColor = UIColor.blue;
		blockBtn.addTarget(self, action: #selector(blockBtnClick), for: .touchUpInside);
		view.addSubview(blockBtn);
		
		let delegateBtn = UIButton(type:.custom);
		delegateBtn.frame = CGRect(x:50,y:80  + 64,width:100,height:30);
		delegateBtn.setTitle("代理函数", for: .normal);
		delegateBtn.backgroundColor = UIColor.blue;
		delegateBtn.addTarget(self, action: #selector(delegateBtnClick), for:.touchUpInside);
		view.addSubview(delegateBtn);
		
		let notificationBtn = UIButton(type:.custom);
		notificationBtn.frame = CGRect(x:80,y:130  + 64,width:100,height:30);
		notificationBtn.setTitle("通知", for: .normal);
		notificationBtn.backgroundColor = UIColor.blue
		notificationBtn.addTarget(self, action: #selector(notificationBtnClick), for: .touchUpInside);
		view.addSubview(notificationBtn);
		
	}
	
	
	func buttonDemo(){
		
	
	}
	
	@objc func blockBtnClick(){
		print("闭包函数");
		
		if self.myblock != nil {
			self.myblock!("闭包这是什么啊");
		}
		
		if self.addBlock != nil {
		let a =	self.addBlock!("添加闭包","新的");
		//接收返回值
			print(a);
			
		}
		
		
	}
	
	@objc func delegateBtnClick(){
		print("代理函数");
		self.delegate?.delegateClick(text: "我是代理");
	}
	
	@objc func notificationBtnClick(){
		print("通知");
		let dict = ["action":"通知被点击回调的数据"];
		NotificationCenter.default.post(name: NSNotification.Name("name"), object: self, userInfo: dict);
	}
	
	func captureValue2(sums amount:Int) -> ()->Int{
		var total = 0
		let AddBlock:()->Int = {
			total += amount
			return total
		}
		return AddBlock
	}
	
	func loadData(completion : @escaping (_ content: [String],_ content2: String) -> ()) -> () {
		
		DispatchQueue.global().async {
			print("耗时操作");
			Thread.sleep(forTimeInterval: 1.0);
			let json = ["头条","八卦","出大事了"];
			DispatchQueue.main.async{
				completion(json,"什么事情");
			}
		}
		}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
