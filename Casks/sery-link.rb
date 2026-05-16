cask "sery-link" do
  version "0.8.7"

  on_arm do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_aarch64.dmg"
    sha256 "516e93dd781cbffc0b0f1aedf9578d12d17d82705d6fbc64463781fdd85b4efb"
  end

  on_intel do
    url "https://github.com/seryai/sery-link/releases/download/v#{version}/Sery.Link_#{version}_x64.dmg"
    sha256 "a5bde24104b716b5edb9aa2268b35f752d0b30623ab74c0e226b3485dbea235b"
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
