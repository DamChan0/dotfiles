#!/bin/bash

echo "📦 Rust 설치 시작..."
if ! command -v cargo &>/dev/null; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    echo '✅ Rust 설치 완료'
else
    echo '✅ Rust는 이미 설치되어 있음'
fi

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
    if ! grep -q 'source "$HOME/.cargo/env"' "$HOME/.zshrc"; then
        echo 'source "$HOME/.cargo/env"' >> "$HOME/.zshrc"
        echo '✅ .zshrc에 Rust 환경 설정 추가됨'
    fi
else
    echo "❌ Rust 환경 파일(.cargo/env)이 존재하지 않음"
    exit 1
fi

if ! command -v zellij &>/dev/null; then
    echo "🔧 zellij 설치 중..."
    cargo install --locked zellij
    echo "✅ zellij 설치 완료"
else
    echo "✅ zellij는 이미 설치되어 있음"
fi

mkdir -p "$HOME/.config/zellij"

echo "🎉 모든 작업 완료. 새로운 터미널에서 zellij 실행 가능!"

