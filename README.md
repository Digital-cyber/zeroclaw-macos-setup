# ZeroClaw macOS Setup

One-command installer for ZeroClaw + Ollama on fresh macOS.

## Quick Install

1. Clone this repo:
   ```bash
   git clone https://github.com/Digital-cyber/zeroclaw-macos-setup.git
   cd zeroclaw-macos-setup
Run installer:

bash
bash setup.sh
Start ZeroClaw:

bash
zeroclaw agent --config ~/.config/zeroclaw/config.toml
What's Installed
Homebrew - Package manager

Ollama - Local LLM runtime (qwen2.5:7b model)

Rust - Build toolchain

ZeroClaw - AI agent framework

Files
File	Purpose
setup.sh	One-command installer
config.toml	ZeroClaw configuration
system-prompt.md	Agent personality
.gitignore	Excludes secrets/logs
Post-Install
bash
# Check status
zeroclaw doctor

# List available models
ollama list

# Pull more models
ollama pull llama3.2
ollama pull deepseek-r1:7b
text

**Commit message:** `Add README`

***

## Done

Your repo now contains the full setup. On any fresh Mac:

```bash
git clone https://github.com/Digital-cyber/zeroclaw-macos-setup.git
cd zeroclaw-macos-setup
bash setup.sh
