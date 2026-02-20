---
name: feishu-image-sender
description: |
  Send images to Feishu. Activate when user mentions sending images to Feishu, or when message contains image file paths/names (.png, .jpg, .jpeg, .gif, .webp).
---

# Feishu Image Sender Skill

## 触发条件

当以下情况时自动激活此技能：
- 用户要求发送图片到飞书
- 消息中包含图片文件路径或文件名（.png, .jpg, .jpeg, .gif, .webp）
- 需要通过飞书媒体消息发送本地图片

## 功能说明

这个 skill 用于在飞书中发送图片消息，并处理相关的文件管理。

## 使用场景

当用户需要：
- 通过飞书发送本地图片
- 自动处理图片上传和消息发送

## 前置条件

1. **图片文件**
   - 图片可以放在任何位置，使用绝对路径即可
   - 建议放在 `~/.openclaw/workspace/` 方便管理（可选）
   - 支持格式：jpg, png, gif, webp

## 使用步骤

### 1. 检查图片文件

```bash
# 在 workspace 目录查找
find ~/.openclaw/workspace -name "图片名.png" -type f

# 或者在其他目录查找
find /path/to/your/directory -name "图片名.png" -type f
```

### 2. 发送图片到飞书

使用 `message` 工具发送图片，提供图片的绝对路径：

```javascript
// 方式 1: 图片在 workspace 目录
message({
  action: "send",
  channel: "feishu",
  message: "图片说明文字",
  media: "/absolute/path/to/image.png"
})

// 方式 2: 图片在 Pictures 目录
message({
  action: "send",
  channel: "feishu",
  message: "图片说明文字",
  media: "/Users/username/Pictures/image.png"
})

// 方式 3: 图片在 Downloads 目录
message({
  action: "send",
  channel: "feishu",
  message: "图片说明文字",
  media: "/Users/username/Downloads/image.jpg"
})
```

## 常见问题

### Q: 图片发送成功但看不到？

A: 检查：
1. 图片路径是否正确
2. 图片格式是否支持

### Q: 如何批量发送多张图片？

A: 循环调用 message 工具，每次发送一张图片。

## 示例代码

### 发送单张图片

```javascript
// 示例 1: 图片在 workspace 目录
message({
  action: "send",
  channel: "feishu",
  message: "这是 test13.png",
  media: "/Users/username/.openclaw/workspace/test13.png"
})

// 示例 2: 图片在 Pictures 目录
message({
  action: "send",
  channel: "feishu",
  message: "这是截图",
  media: "/Users/username/Pictures/screenshot.png"
})

// 示例 3: 图片在项目目录
message({
  action: "send",
  channel: "feishu",
  message: "这是项目图片",
  media: "/path/to/project/assets/logo.png"
})
```

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

// 方式 2: 发送其他目录中的图片
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

## 注意事项

1. **文件路径**：始终使用绝对路径
2. **文件存在性**：发送前检查文件是否存在
3. **格式支持**：只发送支持的图片格式

## 维护记录

- 2026-02-19: 创建 skill，固化飞书图片发送流程
