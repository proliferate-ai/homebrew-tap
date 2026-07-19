cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.43"
  sha256 arm:   "453561f9abb1647975890f04fde99ad4855abce55f34023866d07554cad05d1d",
         intel: "1e51b9af64f8e5f700c938c414705455891ab8694753f28d28d04c71f25fefcc"

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
