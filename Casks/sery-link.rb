cask "sery-link" do
  version "0.8.10"

  on_arm do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_aarch64.dmg"
    sha256 "030aebedce5235e88d3744c4a7cb4de54c2af6ded671cbfed599ca4600d30c8c"
  end

  on_intel do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_x64.dmg"
    sha256 "89da3536ce5ae307e394a04b776ea58458f3060315ac666e887a7ca252b78129"
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
