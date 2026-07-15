cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.29"
  sha256 arm:   "0edde7f1fa9e8ac269c77c7219c53cab8d6d7d0f08d85c4ce2026dd526768097",
         intel: "adaa499ed4267bae9c4536db8e0e413ece11dffbd425b7a30807ecb542ce2a16"

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
