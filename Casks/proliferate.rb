cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.6"
  sha256 arm:   "d6aca3b25473d0b32a05434531b1fcd05a05085150d666ea18701ac7d2e6f205",
         intel: "8eea9ea15d5fe495fa7d101f4ada8662c9b7b5cbc0f2be38fe90f1d0c0026fbf"

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
