# Feishu Image Sender Skill

## 📸 飞书图片发送工具

这个 skill 用于在飞书中发送图片消息，并处理相关的文件管理。

## 🚀 快速开始

### 1. 准备图片文件

图片可以放在任何位置，使用绝对路径即可。

**建议位置：**
- `~/.openclaw/workspace/` - 方便管理 OpenClaw 相关文件
- `~/Pictures/` - 系统图片目录
- `~/Downloads/` - 下载的图片
- 任何自定义路径

### 2. 发送图片

在 OpenClaw 中使用 `message` 工具发送，提供图片的绝对路径：

```javascript
// 示例 1: 图片在 workspace 目录
message({
  action: "send",
  channel: "feishu",
  message: "图片说明文字",
  media: "/Users/username/.openclaw/workspace/test13.png"
})

// 示例 2: 图片在 Pictures 目录
message({
  action: "send",
  channel: "feishu",
  message: "图片说明文字",
  media: "/Users/username/Pictures/photo.jpg"
})

// 示例 3: 图片在 Downloads 目录
message({
  action: "send",
  channel: "feishu",
  message: "图片说明文字",
  media: "/Users/username/Downloads/screenshot.png"
})
```

## 📂 文件结构

```
feishu-image-sender/
├── SKILL.md          # Skill 详细文档
├── README.md         # 本文件
└── send-image.sh     # 辅助脚本（检查图片文件）
```

## 🛠️ 使用辅助脚本

### 检查图片文件

```bash
# 方式 1: 检查 workspace 目录中的图片
cd ~/.openclaw/workspace/skills/feishu-image-sender
./send-image.sh test13.png "这是测试图片"

# 方式 2: 检查其他目录中的图片（使用绝对路径）
cd ~/.openclaw/workspace/skills/feishu-image-sender
./send-image.sh /Users/username/Pictures/photo.jpg "这是照片"
```

脚本会：
- ✅ 检查文件是否存在
- ✅ 验证文件格式
- ✅ 生成发送指令

## 📋 支持的图片格式

- PNG
- JPG / JPEG
- GIF
- WebP

## ⚠️ 常见问题

### 文件不存在

**错误信息：** `图片文件不存在`

**解决方法：**
1. 检查文件路径是否正确（使用绝对路径）
2. 使用 `find` 命令查找文件
3. 确认文件确实存在于指定路径

### 格式不支持

**错误信息：** `不支持的图片格式`

**解决方法：**
1. 转换图片格式（使用 ffmpeg 或 ImageMagick）
2. 使用支持的格式重新发送

## 💡 使用技巧

### 批量发送图片

```javascript
// 方式 1: 发送 workspace 目录中的图片
const images = ["test13.png", "test14.png", "test15.png"];

for (const img of images) {
  message({
    action: "send",
    channel: "feishu",
    message: `发送图片：${img}`,
    media: `/Users/username/.openclaw/workspace/${img}`
  });
}

// 方式 2: 发送不同目录中的图片
const imagePaths = [
  "/Users/username/Pictures/photo1.jpg",
  "/Users/username/Pictures/photo2.jpg",
  "/Users/username/Downloads/screenshot.png"
];

for (const path of imagePaths) {
  message({
    action: "send",
    channel: "feishu",
    message: `发送图片：${path}`,
    media: path
  });
}
```

### 查找所有图片

```bash
# 在 workspace 目录查找
find ~/.openclaw/workspace -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.webp" \)

# 在 Pictures 目录查找
find ~/Pictures -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.webp" \)

# 在 Downloads 目录查找
find ~/Downloads -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.webp" \)
```

## 📝 维护记录

- **2026-02-19**: 创建 skill，固化飞书图片发送流程
  - 创建 SKILL.md 详细文档
  - 创建 send-image.sh 辅助脚本
  - 创建 README.md 使用说明

## 🔗 相关资源

- [OpenClaw 文档](https://docs.openclaw.ai)
- [飞书开放平台](https://open.feishu.cn)
