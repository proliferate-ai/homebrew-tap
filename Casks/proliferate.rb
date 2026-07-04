cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.5"
  sha256 arm:   "edae26a83cf25ae354dbdd340a65afd8ca8f8f1d2f5e00c7cbe8824eda46f534",
         intel: "3c16beefd4dcef8cd9ad6e826820e6a5c25d381aa5ee664e723a127cbdca01f8"

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
