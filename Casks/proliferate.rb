cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.4"
  sha256 arm:   "1669ff208a546b8fae265b73d15db733147d487f0d2ab766560144884a43441c",
         intel: "068cf877fd3cb39277008ec51c3170c7f83adbfa7e6a53e67349e7825a047d31"

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
