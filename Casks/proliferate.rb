cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.9"
  sha256 arm:   "c852819950f72f848ad48e55adb0bc5dcf191cc3149a9a12999c6851c7e26c47",
         intel: "d549885c00c981e66a0d3455de45bf04ae1764bd7a28ce822bf420ccb04b425e"

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
