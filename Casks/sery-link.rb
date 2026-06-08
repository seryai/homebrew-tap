cask "sery-link" do
  version "0.12.8"

  on_arm do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_aarch64.dmg"
    sha256 "022a89c487ff24dcb8629413d461f727d7ac08887d0fb480d2c802da279fdb83"
  end

  on_intel do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_x64.dmg"
    sha256 "551d9910569a93b2c9f046705807ceb4cf9e28386864aad325020e0f99b29392"
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
