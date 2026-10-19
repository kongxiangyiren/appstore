# Magpie

Magpie 是一个本地 AI 网关：把 Claude Code、Codex、Gemini CLI、OpenCode 等编码代理统一接到任意模型供应商，并在额度用尽时自动切换到下一个账号。

**项目地址**: [github.com/yetone/magpie](https://github.com/yetone/magpie)

## 产品介绍

Magpie 在本地提供一个网关（默认 `3425` 端口），同时说 OpenAI Chat、OpenAI Responses、Anthropic Messages 和 Gemini 四种协议，并在它们之间互相转换，流式输出、工具调用和推理内容都会保留。任何支持自定义 Base URL 的客户端都可以直接接入：

```sh
export OPENAI_BASE_URL=http://127.0.0.1:3425/v1     OPENAI_API_KEY=magpie
export ANTHROPIC_BASE_URL=http://127.0.0.1:3425     ANTHROPIC_API_KEY=magpie
export GOOGLE_GEMINI_BASE_URL=http://127.0.0.1:3425 GEMINI_API_KEY=magpie
```

容器内没有可接管的代理，因此这里运行的是网关模式：在浏览器页面（默认 `3430` 端口）中添加供应商、登录订阅、配置路由和查看用量。

## 主要功能

- **任意模型，任意代理**：模型以 `provider/model` 形式列出，切换后自动改写代理的配置文件，并保留原有注释与格式。
- **供应商预设**：Anthropic、OpenAI、Google Gemini、DeepSeek、Kimi、智谱 GLM、通义千问、OpenRouter、Ollama、LM Studio 等，也支持任意 OpenAI / Anthropic 兼容地址。
- **订阅复用**：把已登录的 Claude、ChatGPT、GitHub Copilot、Gemini 等订阅作为供应商提供给其他代理，并支持多账号故障转移。
- **路由组**：把多个模型组合成一个 `group/xxx`，按 `smart`、`order`、`rotate`、`usage`、`pace` 等策略分摊请求。
- **插件**：从 npm 安装 OpenCode 插件或 pi 包，也可以编写网关中间件改写请求与响应。
- **用量与成本**：按供应商、模型、密钥统计请求量与花费。
- **网关密钥**：为每台客户端签发独立密钥，可单独设置额度与可用模型。

## 使用说明

1. 安装完成后打开 `http://<服务器地址>:3430/?k=<Web UI 密钥>`，密钥即安装时生成的 `MAGPIE_WEB_KEY`。
2. 在 **Providers** 中添加供应商或登录订阅。
3. 在 **Gateway → Gateway keys** 中为每台客户端创建密钥，其他机器通过 `http://<服务器地址>:3425/v1` 访问。
4. 若服务器地址不是自动检测到的地址，请在安装参数中填写 **公开地址**（`MAGPIE_PUBLIC_URL`）。

> 页面链接等同于管理权限，请勿公开 `3430` 端口；跨网络访问时建议使用 HTTPS 反向代理或 VPN。
