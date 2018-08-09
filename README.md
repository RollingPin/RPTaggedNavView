# RPTaggedNavView
一个简易的页面顶部标签式导航View, 可轻松实现页面控制切换

# ScreenShot
![image](https://github.com/RollingPin/RPTaggedNavView/blob/master/RPTaggedNavView/RPTaggedNavView/gif_RPTaggedNavView.gif)

# summary

多种属性可动态设置
```
/**
 *  标签文字颜色_未选中时
 */
@property (nonatomic, strong) UIColor * tagTextColor_normal;
/**
 *  标签文字颜色_选中时
 */
@property (nonatomic, strong) UIColor * tagTextColor_selected;
/**
 *  标签文字颜色_未选中时
 */
@property (nonatomic, assign)CGFloat tagTextFont_normal;
/**
 *  标签文字颜色_选中时
 */
@property (nonatomic, assign)CGFloat tagTextFont_selected;
/**
 *  滑块颜色
 */
@property (nonatomic, strong)UIColor *sliderColor;
/**
 *  滑块宽度
 */
@property (nonatomic, assign)CGFloat sliderW;
/**
 *  滑块高度
 */
@property (nonatomic, assign)CGFloat sliderH;
```

通过此代理方法可获取标签点击事件和第几个
```
@protocol RPTaggedNavViewDelegate <NSObject>

- (void)haveSelectedIndex:(NSInteger )index;

@end
```

此方法为通知view应该让哪个标签被点亮
```
- (void)selectingOneTagWithIndex:(NSInteger )index;
```

QQ: 1355582130@qq.com 欢迎指正
