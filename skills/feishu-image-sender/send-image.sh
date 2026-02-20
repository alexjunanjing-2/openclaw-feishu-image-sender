#!/bin/bash

# Feishu Image Sender Helper Script
# 用法: ./send-image.sh <图片路径> [说明文字]
# 图片路径可以是绝对路径或相对路径（相对于 workspace）

set -e

# 配置
WORKSPACE="${OPENCLAW_WORKSPACE:-$HOME/.openclaw/workspace}"
IMAGE_INPUT="$1"
MESSAGE="${2:-发送图片}"

# 检查参数
if [ -z "$IMAGE_INPUT" ]; then
    echo "❌ 错误：请提供图片路径"
    echo "用法: $0 <图片路径> [说明文字]"
    echo ""
    echo "示例："
    echo "  $0 test13.png '这是测试图片'              # 相对路径（workspace 目录）"
    echo "  $0 /Users/username/Pictures/photo.jpg '照片'  # 绝对路径"
    exit 1
fi

# 判断是绝对路径还是相对路径
if [[ "$IMAGE_INPUT" == /* ]]; then
    # 绝对路径
    IMAGE_PATH="$IMAGE_INPUT"
else
    # 相对路径，在 workspace 目录中查找
    IMAGE_PATH="$WORKSPACE/$IMAGE_INPUT"
fi

# 检查文件是否存在
if [ ! -f "$IMAGE_PATH" ]; then
    echo "❌ 错误：图片文件不存在"
    echo "路径: $IMAGE_PATH"
    echo ""
    echo "可用的图片文件（在 workspace 目录）："
    find "$WORKSPACE" -maxdepth 1 -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.webp" \) | while read -r file; do
        echo "  - $file"
    done
    echo ""
    echo "提示：你也可以使用绝对路径指向任何位置的图片文件"
    exit 1
fi

# 检查文件格式
FILE_EXT="${IMAGE_NAME##*.}"
case "$FILE_EXT" in
    png|jpg|jpeg|gif|webp)
        ;;
    *)
        echo "❌ 错误：不支持的图片格式"
        echo "支持的格式：png, jpg, jpeg, gif, webp"
        exit 1
        ;;
esac

echo "📸 准备发送图片到飞书..."
echo "文件: $IMAGE_PATH"
echo "说明: $MESSAGE"
echo ""

# 这里需要通过 OpenClaw 的 message 工具发送
# 这个脚本只是辅助检查，实际发送需要通过 OpenClaw

echo "✅ 图片文件检查通过"
echo ""
echo "📋 发送指令（在 OpenClaw 中执行）："
echo ""
echo "message({"
echo "  action: \"send\","
echo "  channel: \"feishu\","
echo "  message: \"$MESSAGE\","
echo "  media: \"$IMAGE_PATH\""
echo "})"
