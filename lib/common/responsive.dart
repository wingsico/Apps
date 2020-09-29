import 'dart:ui';

class Responsive {
  static double physicalWidth;
  static double physicalHeight;
  static double dpr;
  static double screenWidth;
  static double screenHeight;
  static double statusHeight;
  static double bottomHeight;

  static double rpx;

  static void init() {
    //1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    //2.获取dpr
    dpr = window.devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏的高度
    statusHeight = window.padding.top / dpr;

    // 5.底部菜单按钮的高度
    bottomHeight = window.padding.bottom / dpr;

    // 6.计算rpx的大小
    rpx = screenWidth / 750;
  }

  fitWidth(width) {
    return rpx * width;
  }
}
