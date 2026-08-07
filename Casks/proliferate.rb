cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.5"
  sha256 arm:   "4d8311241a72744fd5c812cd154c4662d9191faf5e1f7cf4b18326132e771c63",
         intel: "09484d3d6bea8a241816ce9b57b98057a487380a63cc2fad7f88b4c3f17979fb"

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
