cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.45"
  sha256 arm:   "8e943d889cc7bde0eef620b904d4bceffa59ff8e0d7ffa93217862bd65b787f7",
         intel: "2c687c84dbccdfe17a26361194847af4f77b386f4a6190009a4ad0992b8de0a6"

  url "https://downloads.proliferate.com/desktop/stable/Proliferate_#{version}_#{arch}.dmg"
  name "Proliferate"
  desc "Open-source AI IDE for running coding agents in parallel"
  homepage "https://proliferate.com/"

  livecheck do
    url "https://downloads.proliferate.com/desktop/stable/installers.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Proliferate.app"

  zap trash: [
    "~/Library/Application Support/com.proliferate.app",
    "~/Library/Caches/com.proliferate.app",
    "~/Library/Preferences/com.proliferate.app.plist",
    "~/Library/Saved Application State/com.proliferate.app.savedState",
  ]
end
