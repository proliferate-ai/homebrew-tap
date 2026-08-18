cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.17"
  sha256 arm:   "ad2a299b3a4e4cc4f007fa2140521558a495779ec729c557345430acc814cbad",
         intel: "07b3f45013be156c1662aa60f2da99e7394617d9c2f6820a8d54a6e1f7ad98ab"

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
