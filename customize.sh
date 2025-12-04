##########################################################################################
#
# Magisk Module Template Config Script
# 莫晨
#
##########################################################################################
##########################################################################################
#
# Instructions:
#
# 1. Place your files into system folder (delete the placeholder file)
# 2. Fill in your module's info into module.prop
# 3. Configure the settings in this file (config.sh)
# 4. If you need boot scripts, add them into common/post-fs-data.sh or common/service.sh
# 5. Add your additional or modified system properties into common/system.prop
#
##########################################################################################

##########################################################################################
# Configs
##########################################################################################

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
SKIPMOUNT=false
#是否安装模块后自动关闭，改为true，安装后不会自动勾选启用

# Set to true if you need to load system.prop
PROPFILE=true
#是否使用common/system.prop文件

# Set to true if you need post-fs-data script
POSTFSDATA=false
#是否使用post-fs-data脚本执行文件

# Set to true if you need late_start service script
LATESTARTSERVICE=true
#是否在开机时候允许允许common/service.sh中脚本

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "*******************************"
  ui_print "  Magisk Module:         "
  ui_print "  莫晨"
  ui_print "*******************************"
}

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="

"
#添加您要精简的APP/文件夹目录
#例如：精简状态栏，找到状态栏目录为  /system/priv-app/SystemUI/SystemUI.apk     
#转化加入:/system/priv-app/SystemUI
#（可以搭配高级设置获取APP目录）

##########################################################################################
# Permissions
##########################################################################################
#释放文件，普通shell命令
on_install() {
  ui_print "- 正在释放文件"
  unzip -o "$ZIPFILE" 'system/*' -d $MODPATH >&2
}

set_permissions() {
  # Only some special files require specific permissions
  # The default permissions should be good enough for most cases

  # Here are some examples for the set_perm functions:

  # set_perm_recursive  <dirname>                <owner> <group> <dirpermission> <filepermission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm_recursive  $MODPATH/system/lib       0       0       0755            0644

  # set_perm  <filename>                         <owner> <group> <permission> <contexts> (default: u:object_r:system_file:s0)
  # set_perm  $MODPATH/system/bin/app_process32   0       2000    0755         u:object_r:zygote_exec:s0
  # set_perm  $MODPATH/system/bin/dex2oat         0       2000    0755         u:object_r:dex2oat_exec:s0
  # set_perm  $MODPATH/system/lib/libart.so       0       0       0644

  # The following is default permissions, DO NOT remove
  set_perm_recursive  $MODPATH  0  0  0755  0644
  
  #设置权限，基本不要去动
}

##########################################################################################
# Custom Functions
##########################################################################################

# This file (config.sh) will be sourced by the main flash script after util_functions.sh
# If you need custom logic, please add them here as functions, and call these functions in
# update-binary. Refrain from adding code directly into update-binary, as it will make it
# difficult for you to migrate your modules to newer template versions.
# Make update-binary as clean as possible, try to only do function calls in it.

echo "正在刷写模块不要乱动手机哦！"
echo"⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄⛄"
echo"🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾🎾"
echo"⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️🚸⚠️⚠️⚠️⚠️⚠️🚸🚸🚸🚸🚸🚸🚸🚸🚸🚸🚸🚸🚸🚸⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️"
echo"🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰🥰"
echo"正在跳转"
echo"🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔😌🤔🤔😌😌🤔😌😌😌😌😌😌😌😌😌😌😌😌😌😌😌😌😌😌😌😌🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔🤔"

#!/bin/bash

LINK="https://qm.qq.com/q/qoDPIv8zao"

if echo "$LINK" | grep -qE '^https?://'; then
    am start -a android.intent.action.VIEW -d "$LINK" >/dev/null 2>&1
    echo "已打QQ群链接: $LINK"
else
    echo "无效的链接格式: $LINK"
fi

sleep 8

LINK="https://b23.tv/ynHQCiC"

if echo "$LINK" | grep -qE '^https?://'; then
    am start -a android.intent.action.VIEW -d "$LINK" >/dev/null 2>&1
    echo "已打开链接: $LINK"
else
    echo "无效的链接格式: $LINK"
fi


sleep 5


  ui_print "- 正在进入b站，点个关注吧"

coolapkTesting=`pm list package | grep -w 'com.coolapk.market'`
  if [[ "$coolapkTesting" != "" ]];then
  am start -d 'coolmarket://u/39590720' >/dev/null 2>&1
  fi



sleep 5


echo "正在刷入不要退出"

echo "🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁？"
echo " "
echo "👉点击音量上 确认装了救砖模块，继续安装"
echo "👉点击音量下 我没有装呀！救命呀！退出安装"
key_click=""
while [ -z "$key_click" ]; do
    key_click="$(getevent -qlc 1 | awk '/KEY_/{print $3}')"
    sleep 0.5
done
if [ "$key_click" = "KEY_VOLUMEUP" ]; then
echo " "
echo "开始刷入"
elif [ "$key_click" = "KEY_VOLUMEDOWN" ]; then
echo " "
echo "取消刷入。"
exit 1
fi


sleep 1

echo "magisk跟lkm模式不能装susfs，显示失败正常。"

sleep 1

echo "安装susfs卡住了开一下vpn，或者直接把网络关闭再打开"

#!/system/bin/sh

# 获取脚本自身所在的目录
MODULE_DIR="$MODPATH"

# 设置目标 APK 文件夹路径
APK_DIR="$MODULE_DIR/apk"

# 检查 APK 文件夹是否存在
if [ ! -d "$APK_DIR" ]; then
    echo "错误：目录 $APK_DIR 不存在，请确保该文件夹存在并包含 APK 文件。"
    exit 1
fi

# 检查目录中是否有 APK 文件
APK_FILES=$(ls "$APK_DIR"/*.apk 2>/dev/null)

if [ -z "$APK_FILES" ]; then
    echo "错误：目录 $APK_DIR 中没有找到任何 APK 文件。"
    exit 1
fi


for APK_FILE in "$APK_DIR"/*.apk; do
    # 跳过非文件（避免目录或无效路径）
    if [ -f "$APK_FILE" ]; then
        echo "正在安装 APK: $(basename "$APK_FILE")"
        pm install "$APK_FILE"
        # 检查安装结果
        if [ $? -eq 0 ]; then
            echo "✅ 安装成功"
        else
            echo "❌ 安装失败（错误码：$?）"
        fi
    fi
done


#!/system/bin/sh

# 模块目录
MODULE_DIR="$MODPATH/MostSky"

# 定义需要检测的包名（APatch相关）
AP_PKGS="me.bmax.apatch me.garfieldhan.apatch.next"

# 定义需要检测的包名（KSU Next相关）
KSU_NEXT_PKGS="com.sukisu.ultra com.rifsxd.ksunext"

# 定义需要检测的包名（KSU Classic相关）
KSU_CLASSIC_PKGS="me.weishu.kernelsu"

# 定义需要检测的包名（Magisk相关）
MAGISK_PKGS="com.topjohnwu.magisk io.github.vvb2060.magisk io.github.huskydg.magisk"

# 检测运行中的程序（返回环境类型）
detect_running_env() {
    # 检测优先级：APatch > KSU Next > KSU Classic > Magisk
    
    # 1. 检测APatch程序
    for pkg in $AP_PKGS; do
        if pidof "$pkg" >/dev/null 2>&1; then
            echo "ap"
            return
        fi
    done
    
    # 2. 检测KSU Next程序
    for pkg in $KSU_NEXT_PKGS; do
        if pidof "$pkg" >/dev/null 2>&1; then
            echo "ksu_next"
            return
        fi
    done
    
    # 3. 检测KSU Classic程序
    for pkg in $KSU_CLASSIC_PKGS; do
        if pidof "$pkg" >/dev/null 2>&1; then
            echo "ksu_classic"
            return
        fi
    done
    
    # 4. 检测Magisk相关程序
    for pkg in $MAGISK_PKGS; do
        if pidof "$pkg" >/dev/null 2>&1; then
            echo "magisk"
            return
        fi
    done
    
    # 未检测到
    echo "unknown"
}

# 主安装逻辑
main() {
    # 获取环境类型
    ENV_TYPE=$(detect_running_env)
    if [ "$ENV_TYPE" = "unknown" ]; then
        ui_print "未检测到运行中的管理程序，将尝试默认安装方式..."
    else
        ui_print "检测到环境类型：$ENV_TYPE"
    fi

    # 检查模块目录及ZIP文件
    if [ ! -d "$MODULE_DIR" ] || ! ls "$MODULE_DIR"/*.zip >/dev/null 2>&1; then
        ui_print "错误：$MODULE_DIR 中无ZIP模块"
        exit 1
    fi

    # 读取主模块信息
    MODULE_PROP="$MODPATH/module.prop"
    if [ -f "$MODULE_PROP" ]; then
        MODULE_NAME=$(grep "name=" "$MODULE_PROP" | cut -d '=' -f2)
        MODULE_VERSION=$(grep "version=" "$MODULE_PROP" | cut -d '=' -f2)
        ui_print "主模块：$MODULE_NAME v$MODULE_VERSION"
    fi

    # 遍历安装MostSky目录下的所有ZIP模块
    ui_print "开始安装子模块..."
    for ZIPFILE in "$MODULE_DIR"/*.zip; do
        [ -f "$ZIPFILE" ] || continue
        SUB_MOD_NAME=$(basename "$ZIPFILE" .zip)
        ui_print "处理子模块：$SUB_MOD_NAME"

        if [ "$ENV_TYPE" = "unknown" ]; then
            # 未检测到环境时，先尝试KSU Classic方式
            ui_print "尝试KSU Classic方式安装..."
            install_module "$ZIPFILE" >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                ui_print "✅ $SUB_MOD_NAME 用KSU Classic方式安装成功"
                continue
            fi
            
            # KSU Classic失败，尝试Magisk方式
            ui_print "KSU Classic方式失败，尝试Magisk方式..."
            magisk --install-module "$ZIPFILE" >/dev/null 2>&1
            if [ $? -eq 0 ]; then
                ui_print "✅ $SUB_MOD_NAME 用Magisk方式安装成功"
            else
                ui_print "❌ $SUB_MOD_NAME 两种方式均安装失败"
            fi
        else
            # 已知环境类型，按对应方式安装
            case "$ENV_TYPE" in
                "magisk")
                    magisk --install-module "$ZIPFILE" >/dev/null 2>&1
                    ;;
                "ksu_classic")
                    install_module "$ZIPFILE" >/dev/null 2>&1
                    ;;
                "ksu_next")
                    /data/adb/ksud module install "$ZIPFILE" >/dev/null 2>&1
                    ;;
                "ap")
                    /data/adb/apd module install "$ZIPFILE" >/dev/null 2>&1
                    ;;
            esac

            if [ $? -eq 0 ]; then
                ui_print "✅ $SUB_MOD_NAME 安装成功"
            else
                ui_print "❌ $SUB_MOD_NAME 安装失败"
            fi
        fi
    done

    ui_print "所有操作完成"
}

# 执行主逻辑
main



#!/bin/bash

# 获取 ro.boot.vbmeta.digest 的值
HASH_VALUE=$(getprop ro.boot.vbmeta.digest)

# 确保 MODPATH 变量已设置
if [ -z "$MODPATH" ]; then
    echo "错误: MODPATH 变量未设置。请设置 MODPATH 指向目标目录。"
    exit 1
fi

# 定义 system.prop 文件的完整路径
SYSTEM_PROP_FILE="$MODPATH/system.prop"

# 检查 system.prop 是否存在，如果不存在则创建一个空文件
if [ ! -f "$SYSTEM_PROP_FILE" ]; then
    touch "$SYSTEM_PROP_FILE"
    if [ $? -ne 0 ]; then
        echo "错误: 无法创建文件 $SYSTEM_PROP_FILE"
        exit 1
    fi
fi

# 将哈希值写入 system.prop 文件
echo "ro.boot.vbmeta.digest=$HASH_VALUE" > "$SYSTEM_PROP_FILE"

# 检查写入是否成功
if [ $? -eq 0 ]; then
    echo "成功: 哈希值已写入 $SYSTEM_PROP_FILE"
else
    echo "错误: 无法写入到 $SYSTEM_PROP_FILE"
    exit 1
fi

# 将 ro.boot.veritymode=enforcing 追加写入到 system.prop 文件
echo "ro.boot.veritymode=enforcing" >> "$SYSTEM_PROP_FILE"

# 检查追加写入是否成功
if [ $? -eq 0 ]; then
    echo "成功: ro.boot.veritymode=enforcing 已追加写入 $SYSTEM_PROP_FILE"
else
    echo "错误: 无法追加写入到 $SYSTEM_PROP_FILE"
    exit 1
fi


MODPATH=$(dirname $0)
AVBCTL="$MODPATH/system/bin/avbctl"

[ -x "$AVBCTL" ] ||  

"$AVBCTL" disable-verity --force >/dev/null 2>&1
"$AVBCTL" disable-verification --force >/dev/null 2>&1









echo " "
echo " "
echo " "
echo " 作者 b站@莫晨又菜又爱玩"
echo " "
echo " "
echo "莫晨一键隐藏模块更新介绍 v1.0.0"

echo " "

echo "1.更新zygisk1.3.0正式版 更新隐藏应用列表正版最新版3.6.1 更新Ticky store1.4.1 SUSFS-FOR-KERNELSU-v1.5.2-R23，更新hunter6.46"

echo " "

echo "2.更改回开机自动更新隐藏应用列表配置，执行操作按钮才更新配置"

echo " "

echo "3.自动删除目标target游戏包名"

echo " "

echo "4.增加莫晨一键隐藏环境黑名单配置"

echo " "

echo " "

echo "本模块一键安装过环境经典必备套装 "

echo " "

echo "隐藏主力当然是susfs，shamkio"

echo " "

echo "配合一些环境小配置。哈希值有效key等。 "

echo " "

echo "详细操作请查看使用说明教程图片文件 "

echo " "

echo "简单来说就开机了，激活隐藏应用列表app。点操作按钮加入配置"


echo " "

echo " 然后再次重启启动隐藏应用列表app,莫晨环境隐藏app"

echo " "
echo " 然后尝试拦截有次数就行了"

echo " "

echo " 感谢使用，欢迎下次使用"
echo " "
echo " "
echo " "
echo " "
echo " "