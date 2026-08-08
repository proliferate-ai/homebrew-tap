cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.7"
  sha256 arm:   "be25b62822e0ee21482c508c6c1cfceb99e0f78b477b318e408b03bda1eb0f6d",
         intel: "fdd527728219afce7a102daad936cab51213b4a16e54bdf706b80b094f630ae5"

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
