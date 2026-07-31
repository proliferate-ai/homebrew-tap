cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "16c67decd1c1e1c3b9fc505c081fd5f2aa99976b762693c7ebcd842f4e72e69c",
         intel: "8cd241a2f79d7eb4a7119288f5966c34859f7931f4f2d5e7a0f122db46012c26"

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
