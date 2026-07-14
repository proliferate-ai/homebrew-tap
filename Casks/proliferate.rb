cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.28"
  sha256 arm:   "3e6d304832c328687e6089f61e255ae37b7b62aedd638316c0fc9803c78e2b3b",
         intel: "c7943d22e4eaef3de4c4ab269f25628e681e886657cc84d8bfdca4d9b3485be5"

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
