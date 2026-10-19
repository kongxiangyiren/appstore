# Magpie

Magpie is a local AI gateway: it puts any model behind any coding agent — Claude Code, Codex, Gemini CLI, OpenCode — and moves on to the next account when a quota runs out.

**Project**: [github.com/yetone/magpie](https://github.com/yetone/magpie)

## Introduction

Magpie serves a gateway on your machine (port `3425` by default) that speaks OpenAI Chat, OpenAI Responses, Anthropic Messages and Gemini, and translates between them — streaming, tool calls and reasoning included. Anything that takes a base URL can use it:

```sh
export OPENAI_BASE_URL=http://127.0.0.1:3425/v1     OPENAI_API_KEY=magpie
export ANTHROPIC_BASE_URL=http://127.0.0.1:3425     ANTHROPIC_API_KEY=magpie
export GOOGLE_GEMINI_BASE_URL=http://127.0.0.1:3425 GEMINI_API_KEY=magpie
```

The container finds no agents to wire, so it runs in gateway mode: add providers, sign in to subscriptions, set up routing and read usage from a page in your browser (port `3430` by default).

## Features

- **Any model, any agent**: models are listed as `provider/model`; switching rewrites the agent's config atomically and keeps its comments and formatting.
- **Provider presets**: Anthropic, OpenAI, Google Gemini, DeepSeek, Kimi, Zhipu GLM, Qwen, OpenRouter, Ollama, LM Studio and more, plus any OpenAI- or Anthropic-compatible URL.
- **Subscriptions**: offer a signed-in Claude, ChatGPT, GitHub Copilot or Gemini subscription to every other agent, with failover between accounts.
- **Routing groups**: several models an agent picks as one `group/xxx`, spread with `smart`, `order`, `rotate`, `usage` or `pace`.
- **Plugins**: install OpenCode plugins or pi packages from npm, or write gateway middleware that rewrites requests and responses.
- **Usage and cost**: requests and spend per provider, model and key.
- **Gateway keys**: one key per client, each with its own limits and model list.

## Getting started

1. Open `http://<host>:3430/?k=<Web UI key>` after installing; the key is the `MAGPIE_WEB_KEY` generated during installation.
2. Add providers or sign in to subscriptions on **Providers**.
3. Create a key per client under **Gateway → Gateway keys**; other machines reach the gateway at `http://<host>:3425/v1`.
4. If the detected address is not the one clients use, set **Public URL** (`MAGPIE_PUBLIC_URL`) in the install parameters.

> The page link is equivalent to admin access. Do not expose port `3430` publicly; use an HTTPS reverse proxy or a VPN across networks.
