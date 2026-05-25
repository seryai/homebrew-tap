cask "sery-link" do
  version "0.10.1"

  on_arm do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_aarch64.dmg"
    sha256 "4af09ee357951787ae0a39a22505865c21ed6614a217404f6ed8515695bc3f03"
  end

  on_intel do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_x64.dmg"
    sha256 "e7ccfd94a16e7fa04dd51038d1c59ab60693d55e0544f6d6ba19b2651021a056"
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
