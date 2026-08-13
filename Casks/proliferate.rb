cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.9"
  sha256 arm:   "0db6e37be2d1c30c584fc364c2974a1894b3fcd4c59a95d41898689deae16a4a",
         intel: "b5f08e40e440f09de7de98f861b75f9b7c4e84de65fdeb6369837b6c2b2101d3"

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
