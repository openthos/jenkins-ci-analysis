# App Development with Android Studio on OPENTHOS

## Android Studio安装步骤

张善民（zhangshanmin@mail.tsinghua.edu.cn）

### 在OPENTHOS上运行Android Studio进行应用程序开发需要下载以下组件：
- startas.sh
````
cd /data
scp lh@192.168.0.180:/home/lh/zsm/startas.sh .
````
- ubuntu.img
````
cd /data
scp lh@192.168.0.180:/home/lh/zsm/ubuntu.img .
````
- xandroid.apk
````
cd /data
scp lh@192.168.0.180:/home/lh/zsm/xandroid.apk .
pm install xandroid.apk
````
### 各组件功能解释

- startas.sh
1. 自动启动Android X Server App
2. 自动挂载必要目录
3. 自动设置环境变量
4. chroot至Ubuntu并启动Android Studio
- ubuntu.img
1. 包含Ubuntu 18.04 rootfs
2. 包含Android Studio
3. 每周例行更新
- xandroid.apk
1. Android 上的X Server

### 运行步骤
1. 打开终端（Alt+F1或者终端app均可）
2. 确保/data/目录中存在ubuntu.img
3. 执行
````
sh startas.sh
````

## 各目录功能
- /data/ubuntu ubuntu.img的挂载点，也是chroot后的根文件系统。除/root目录外，都是**只读**的。
- /data/ubuntu-data 对应chroot-ubuntu的HOME目录，也就是/root目录。每次挂在ubuntu.img时，通过mount --bind挂载至/root目录。ubuntu.img更新时，对此目录中的文件无影响。此目录中包含Android Sdk和项目源码，应及时备份保存。

## 故障排除

### 【故障】鼠标不跟着走
关闭Android Studio App，清除数据，重新运行打开终端运行sh startas.sh

### 【故障】adb不可用
在目标机运行
````
stop adbd
start adbd
````
重新启动adbd服务
在android studio终端中，运行
````
adb connect 192.168.0.XX
````
运行
````
adb devices
````
查看设备状态，如果设备正常，将会显示**device**。
