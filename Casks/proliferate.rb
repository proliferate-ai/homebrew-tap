cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.35"
  sha256 arm:   "f59b4ccfc2f1525ae2256a6ab45ae2daef81db30b41e789b664c03b613fbd803",
         intel: "74d57b259722c50e53a377ee35ae777801c4579222e305904195be5a7ee7a3ba"

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
