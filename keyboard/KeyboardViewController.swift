//
//  KeyboardViewController.swift
//  keyboard
//
//  Created by qi on 15/12/3.
//  Copyright © 2015年 im.windgo. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton! //切换输入法
    @IBOutlet var yizhihongxingButton: UIButton! //输入一支红杏出墙来的按钮
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Perform custom UI setup here
        
        //创建切换到另一个键盘的按钮
        self.nextKeyboardButton = UIButton(type: .System)
        self.nextKeyboardButton.setTitle(NSLocalizedString("切换键盘", comment: "切换到下一个键盘的按钮"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nextKeyboardButton)
        
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        
        yizhihongxingButton=UIButton()
        yizhihongxingButton.backgroundColor=UIColor.magentaColor()
        yizhihongxingButton.setTitle("一支红杏出墙来！", forState: UIControlState.Normal)
        yizhihongxingButton.frame=CGRectMake(0, 40, UIScreen.mainScreen().bounds.width, 100)
        yizhihongxingButton.addTarget(self, action: "onInputText", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(yizhihongxingButton)
        

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    func onInputText(){
        self.textDocumentProxy.insertText("一支红杏出墙来！")
    }

}
