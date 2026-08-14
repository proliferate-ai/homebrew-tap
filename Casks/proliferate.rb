cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.11"
  sha256 arm:   "81c946c65ead001aedc9a306c02efe8909906e4b07dae21447e8bbce5494b86a",
         intel: "83dfe948fd2818357cea8d4d89966235a32d031836e9a9660cdee5aadfbe578e"

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
