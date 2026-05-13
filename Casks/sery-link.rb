cask "sery-link" do
  version "0.8.1"

  on_arm do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_aarch64.dmg"
    sha256 "5cea2b7625d8ea5fd04abb28ffcc73a5e63281dd3b5d36497360dbed43466ae5"
  end

  on_intel do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_x64.dmg"
    sha256 "2ff71878743c210df47e5f2dec9bd1d386d4952c088670eea5d5830b055de5e6"
  end

  name "Sery Link"
  desc "Universal data gateway — every cloud storage in one app"
  homepage "https://sery.ai"

  app "Sery Link.app"

  zap trash: [
    "~/Library/Application Support/sery-link",
    "~/Library/Preferences/ai.sery.link.plist",
    "~/Library/Logs/sery-link",
    "~/.seryai",
  ]
end
