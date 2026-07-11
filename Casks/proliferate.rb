cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.24"
  sha256 arm:   "96ca7ce533e249b26ea739f5b167a5d5cdf8da96620d93dec81bf5687c40af74",
         intel: "b9b31213f656cf809da0a3a610c77df77918ea9b81b6c31c9194930d10034058"

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
