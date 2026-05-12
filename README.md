# homebrew-tap

Homebrew tap for [Sery Link](https://sery.ai).

## Install via Homebrew (macOS)

```bash
brew install --cask seryai/tap/sery-link
```

Or add the tap first:

```bash
brew tap seryai/tap
brew install --cask sery-link
```

## Install via curl (macOS + Linux)

```bash
curl -fsSL https://sery.ai/install.sh | sh
```

Detects your OS and architecture automatically.

- macOS arm64 → `Sery.Link_<version>_aarch64.dmg`
- macOS x86_64 → `Sery.Link_<version>_x64.dmg`
- Linux x86_64 (Debian/Ubuntu) → `.deb` via `dpkg`
- Linux x86_64 (other) → `.AppImage` in `~/.local/bin`

## Update the cask for a new release

1. Download both DMGs from the GitHub release.
2. Compute SHA256:
   ```bash
   shasum -a 256 Sery.Link_<version>_aarch64.dmg
   shasum -a 256 Sery.Link_<version>_x64.dmg
   ```
3. Edit `Casks/sery-link.rb` — bump `version` and both `sha256` values.
4. Edit `install.sh` — bump `VERSION`.
5. Commit and push.
