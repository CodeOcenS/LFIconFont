//
//  ViewController.swift
//  iconFontText1
//
//  Created by  Apple on 2017/10/31.
//  Copyright © 2017年 LiFu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //定义图标(建议单独放在一个文件中，方便统一管理)
    let icon_delete = LFIconFont(code: "\u{e645}", name: "删除")
    let icon_pointer = LFIconFont(code: "\u{e504}", name: "大头针")

    override func viewDidLoad() {
        super.viewDidLoad()
        addIconfont()
        useExtension()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     //调用LFIconFont在Label  和 UIView中使用
    func addIconfont() -> Void {
        //在UILable中使用
        let deletelabel = UILabel(frame: CGRect(x: 50, y: 100, width: 250, height: 50))
        deletelabel.font = UIFont.init(name: "iconFont", size: 20) //在UILabel中使用是必须设置font,否则无法正常显示
        deletelabel.text = "这是删除图标：" + icon_delete.labelText
        deletelabel.textColor = .gray
        self.view.addSubview(deletelabel)
        //直接转化为Image图标使用
        let deleteImage = icon_delete.iconFontImage(fontSize: 30, color: .green)
        let imgView = UIImageView(frame: CGRect(x: 50, y: 200, width: deleteImage.size.width, height: deleteImage.size.height))
        imgView.image = deleteImage
        self.view.addSubview(imgView)
    }
    //扩展UILabel   和   UIImage
    func useExtension() -> Void {
        //直接通过UILabel初始化
        let iconLabel = UILabel(iconfont: icon_pointer.code, frame: CGRect(x: 50, y: 300, width: 50, height: 50), fontSize:18)
        iconLabel.textColor = .blue
        self.view.addSubview(iconLabel)
        
        //直接初始化为UIImage
        let iconImage = UIImage(iconfont: icon_pointer.code, fontSize: 50, color: .black) //fontSize一般和View高度差不多
        let iconView = UIImageView(image: iconImage)
        iconView.frame = CGRect(x: 50, y: 400, width: 50, height: 50)
        self.view.addSubview(iconView)
    }
    
    

}

