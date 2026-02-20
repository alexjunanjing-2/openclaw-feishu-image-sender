# 安装指南

## 方法 1: 克隆仓库

```bash
cd ~/.openclaw/workspace/skills
git clone https://github.com/alexjunanjing-2/openclaw-feishu-image-sender.git
```

## 方法 2: 下载 ZIP

1. 访问 https://github.com/alexjunanjing-2/openclaw-feishu-image-sender
2. 点击 "Code" 按钮
3. 选择 "Download ZIP"
4. 解压到 `~/.openclaw/workspace/skills/feishu-image-sender`

## 方法 3: 使用 OpenClaw 技能管理器

如果 OpenClaw 支持技能管理器，可以直接安装：

```bash
openclaw skill install feishu-image-sender
```

## 验证安装

```bash
ls -la ~/.openclaw/workspace/skills/feishu-image-sender
```

应该看到：
- SKILL.md
- README.md
- send-image.sh
- LICENSE
