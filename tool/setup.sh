#!/usr/bin/env bash
set -euo pipefail
if ! command -v flutter >/dev/null 2>&1; then
  git clone --depth 1 --branch stable https://github.com/flutter/flutter.git "$HOME/flutter"
  echo 'export PATH="$HOME/flutter/bin:$PATH"' >> "$HOME/.bashrc"
  export PATH="$HOME/flutter/bin:$PATH"
fi
flutter config --enable-web
flutter create --platforms=web,android --project-name basee .
flutter pub get
echo "Ready: run flutter run -d web-server --web-hostname 0.0.0.0 --web-port 8080"
