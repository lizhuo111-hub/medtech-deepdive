#!/bin/bash
# Cloudflare Pages 一键部署脚本
# 用法: ./deploy.sh
# 第一次跑会触发 wrangler login(弹浏览器授权),之后就不用再输了

set -e

echo "🚀 开始部署 medtech-deepdive 到 Cloudflare Pages..."

# 检查 wrangler 是否安装
if ! command -v npx &> /dev/null; then
  echo "❌ 错误:需要先安装 Node.js (https://nodejs.org)"
  exit 1
fi

# 检查是否已登录
if ! npx --yes wrangler@latest whoami &> /dev/null; then
  echo "🔐 第一次部署,需要登录 Cloudflare..."
  echo "    即将打开浏览器,授权后回到这里继续"
  npx --yes wrangler@latest login
fi

echo ""
echo "📦 部署中..."
npx --yes wrangler@latest pages deploy . \
  --project-name medtech-deepdive \
  --commit-dirty=true

echo ""
echo "✅ 部署完成!"
echo "🌐 访问地址:https://medtech-deepdive.pages.dev"
