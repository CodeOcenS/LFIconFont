//
//  LFIconFont.swift
//  iconFontText1
//
//  Created by  Apple on 2017/10/31.
//  Copyright © 2017年 LiFu. All rights reserved.
//
//iconfont的基本信息 ,基本只是一个存iconFont的类型， 可以获得UIlabel 和相关的image

//注意：iconfont的图标大小收font的大小影响。

import UIKit
import CoreText

class LFIconFont: NSObject {
    var code:String       //标准解析格式 比如："\u{a62b}"
    var name:String       //图标的名字.一般为中文，比如：设置
    var descr:String!     //图标作用和备注
    var labelText:String! //可以直接赋值给UILabel,以系统字体大小为基准
    var iconImage:UIImage!//生成一个一般的iconImge  如果需要其他大小的可以自己调整， 使用第二个初始化中代码段。
    
    ///初始化图标
    /// - important : fontsize可通过外部font的size调整,而且必须设置UILabel的font,否则无法正常显示。比如：
    /// - label.font = UIFont.init(name: "IconFont", size: UIFont.systemFontSize)
    /// - parameter code: 标准解析格式，比如："\u{a62b}"
    /// - parameter name:图标的中文名
    init(code:String, name:String) {
        self.code = code
        self.name = name
        //为UILabel使用的做准备
        let label = UILabel()
        
        label.text = code
        self.labelText = label.text
    }
    ///初始化图标 ,图片可用
    /// - important :图片大小由iconFont的fontSize自动计算决定。建议UIImageView大小参考打印值,这样的图片显示效果是最好的。
    /// - parameter code: 标准解析格式，比如："\u{a62b}"
    /// - parameter name:图标的中文名
    /// - parameter fontSize:图标（字体大小）
    /// - parameter color:图标的颜色
    convenience init(code:String, name:String, fontSize:CGFloat, color:UIColor){
        self.init(code: code, name: name)
        //计算文本rect
        let nscode = code as NSString
        let rect = nscode.boundingRect(with:CGSize(width: 0.0, height: 0.0) , options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font :  UIFont(name: "IconFont", size: fontSize)!], context: nil)
        let size = rect.size
        print("建议图片大小：\(size)") //建议UIImageView大小参考打印值
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        label.font = UIFont(name: "IconFont", size: fontSize)
        label.textAlignment = .center
        label.textColor = color
        label.text = code
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        self.iconImage = image
    }
    
    ///直接生成该图标的UIImage 对象
    /// - important :图片大小由iconFont的fontSize自动计算决定。建议UIImageView大小参考打印值,这样的图片显示效果是最好的。
    /// - parameter fontSize:图标（字体大小）
    /// - parameter color:图标的颜色
    func iconFontImage(fontSize:CGFloat, color:UIColor) -> UIImage {
        //计算iconFont的宽高
        let nscode = code as NSString
        let rect = nscode.boundingRect(with:CGSize(width: 0.0, height: 0.0) , options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: fontSize)], context: nil)
        let size = rect.size
        print("建议图片大小：\(size)") //建议UIImageView大小参考打印值
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        label.font = UIFont(name: "IconFont", size: fontSize) //??为什么用IconFont和字体文件名一致（首字母大小写无所谓）,但是不能换为其他的，哪怕你的iconFont的名字为其他的。
        label.textAlignment = .center
        label.text = code
        label.textColor = color
        label.layer.render(in: UIGraphicsGetCurrentContext()!)   //??深入了解layer
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
        
    }

}

//MARK: - 扩展UILable
extension UILabel{
    ///直接通过UILabel加载iconfont
    /// - parameter iconfont: 图标的编码标准格式如："\u{a626}"
    convenience init(iconfont code:String, frame: CGRect ,fontSize:CGFloat) {
        self.init(frame: frame)
        self.text = code
        self.font = UIFont(name: "IconFont", size: fontSize)
        self.textAlignment = .center
    }
}


//MARK: - 扩展UIImage
extension UIImage {
    ///直接通过生成UIImage
    /// - parameter code: 图标的标准编码 如："\u{a626}"
    /// - parameter fontSize: 图标的字体大小，建议设置为UIImageView的高度，这样最合适，效果最好。
    /// - parameter color: 图标的颜色。
    convenience init(iconfont code:String,fontSize:CGFloat, color:UIColor){
        let iconImage = LFIconFont(code: code, name: "", fontSize: fontSize, color: color).iconImage
        let iconData:Data = UIImagePNGRepresentation(iconImage!) ?? UIImageJPEGRepresentation(iconImage!, 1.0)!
        self.init(data: iconData)!
    }
    
}
