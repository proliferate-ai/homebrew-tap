cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.23"
  sha256 arm:   "ac9749dc995434baf5473b69f217a753614d3aa9a751da2711f329b74efc88ee",
         intel: "fd7f9b7e85acc541887532a686b2a6c45a60bd93cdcdbd46b62834949a82d148"

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
