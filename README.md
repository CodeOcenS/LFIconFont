# LFIconFont
使用iconfont更简单

使用方法：

下载项目，将项目中LFIconFont添加到您的项目中。

第一步：初始化LFIconFont
```
 //定义图标(建议单独放在一个文件中，方便统一管理)
    let icon_delete = LFIconFont(code: "\u{e645}", name: "删除")
    let icon_pointer = LFIconFont(code: "\u{e504}", name: "大头针")
```

第二步：在label中使用
```
//在UILable中使用
        let deletelabel = UILabel(frame: CGRect(x: 50, y: 100, width: 250, height: 50))
        deletelabel.font = UIFont.init(name: "iconFont", size: 20) //在UILabel中使用是必须设置font,否则无法正常显示
        deletelabel.text = "这是删除图标：" + icon_delete.labelText
        deletelabel.textColor = .gray
        self.view.addSubview(deletelabel)
```

转换为图标图片使用
```
//直接转化为Image图标使用
        let deleteImage = icon_delete.iconFontImage(fontSize: 30, color: .green)
        let imgView = UIImageView(frame: CGRect(x: 50, y: 200, width: deleteImage.size.width, height: deleteImage.size.height))
        imgView.image = deleteImage
        self.view.addSubview(imgView)
```

直接调用UIlabel初始化使用
```
//直接通过UILabel初始化
        let iconLabel = UILabel(iconfont: icon_pointer.code, frame: CGRect(x: 50, y: 300, width: 50, height: 50), fontSize:18)
        iconLabel.textColor = .blue
        self.view.addSubview(iconLabel)
```

直接调用UIImge初始化
```
 //直接初始化为UIImage
        let iconImage = UIImage(iconfont: icon_pointer.code, fontSize: 50, color: .black) //fontSize一般和View高度差不多
        let iconView = UIImageView(image: iconImage)
        iconView.frame = CGRect(x: 50, y: 400, width: 50, height: 50)
        self.view.addSubview(iconView)
```
注意：使用合适fontSize参数， 不然图标效果差 （比如可以设置为UIImageView的高度）。

也可以参考打印日志获取最佳的UIImage的Size 截图日志打印：

![打印日志](https://gitee.com/uploads/images/2017/1102/105135_fe7888ea_1438372.png "屏幕快照 2017-11-02 上午10.51.41.png")

效果图：

![输入图片说明](https://gitee.com/uploads/images/2017/1102/103926_3bfbba3e_1438372.png "IMG_1424.PNG")

说明：
- 这里是列表文本这里是列表文本灰色图标为使用在label中的
- 这里是列表文本这里是列表文本绿色表示使用在UIImageView中的
- 这里是列表文本蓝色图标使用UILable扩展方法初始化的。
- 这里是列表文本黑色图标使用UIImage扩展初始化的。

详情使用参考项目中的ViewController.
或者参考博客：[Swift中使用iconfont](http://blog.csdn.net/qq_14920635/article/details/78408761)