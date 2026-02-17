#!/bin/bash
set -e

echo "=== macOS ZeroClaw + Local LLM Setup ==="

# 1. Install Homebrew
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew already installed"
fi

# 2. Install Ollama
if ! command -v ollama &> /dev/null; then
    echo "Installing Ollama..."
    brew install ollama
    brew services start ollama
    sleep 2
else
    echo "Ollama already installed"
fi

# 3. Install Rust
if ! command -v cargo &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust already installed"
fi

# 4. Clone and build ZeroClaw
echo "Cloning ZeroClaw..."
if [ ! -d "$HOME/zeroclaw" ]; then
    git clone https://github.com/openagen/zeroclaw.git "$HOME/zeroclaw"
fi

cd "$HOME/zeroclaw"
echo "Building ZeroClaw..."
cargo build --release
sudo cp target/release/zeroclaw /usr/local/bin/

# 5. Create config directory
CONFIG_DIR="$HOME/.config/zeroclaw"
mkdir -p "$CONFIG_DIR"

# 6. Copy configs from this repo
cp "$(dirname "$0")/config.toml" "$CONFIG_DIR/config.toml"
cp "$(dirname "$0")/system-prompt.md" "$CONFIG_DIR/system-prompt.md"

# 7. Pull default model
ollama pull qwen2.5:7b

echo "=== Setup Complete ==="
echo "Run: zeroclaw agent --config ~/.config/zeroclaw/config.toml"
