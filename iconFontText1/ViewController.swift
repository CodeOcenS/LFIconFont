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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addIconfont() -> Void {
        let label = UILabel(frame: CGRect(x: 50, y: 60, width: 250, height: 50))
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "系统字体"
        label.textColor = .gray
        self.view.addSubview(label)
        
        let deletelabel = UILabel(frame: CGRect(x: 50, y: 100, width: 250, height: 50))
        deletelabel.font = UIFont.init(name: "iconFont", size: 20) //在UILabel中使用是必须设置font,否则无法正常显示
        deletelabel.text = "这是删除图标：" + icon_delete.labelText
        deletelabel.textColor = .gray
        self.view.addSubview(deletelabel)
        let deleteImage = icon_delete.iconFontImage(fontSize: 30, color: .green)
        let imgView = UIImageView(frame: CGRect(x: 50, y: 200, width: deleteImage.size.width, height: deleteImage.size.height))
        imgView.image = deleteImage
        self.view.addSubview(imgView)
        
        let pointerlabel = UILabel(frame: CGRect(x: 50, y: 300, width: 300, height: 50))
        pointerlabel.font = UIFont.init(name: "IconFont", size: 30)
        pointerlabel.text = "这是大头针：" + icon_pointer.labelText
        pointerlabel.textColor = .blue
        self.view.addSubview(pointerlabel)
        let pImage = icon_pointer.iconFontImage(fontSize: 40, color: .blue)
        let pImageView = UIImageView(frame: CGRect(x: 50, y: 400, width: pImage.size.width, height: pImage.size.height))
        pImageView.image = pImage
        self.view.addSubview(pImageView)
        
    }
    
    

}

