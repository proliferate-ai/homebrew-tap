cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.47"
  sha256 arm:   "d402b719c9c21327ba4fe94d7598ff4c1a0a280aa6a6c3a51729374cb9c208b2",
         intel: "9c6aebf0c62447522a24a77486314d3e02164b4e82fbee435fdc6b5d60085966"

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
