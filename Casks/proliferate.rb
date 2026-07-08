cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.12"
  sha256 arm:   "f576904a1e4e48e0a80a7d5a877f3bb6bc1cfca0d34b1da4404cfd3592a1a808",
         intel: "0500fb36afd5ab0b4bc5f2ff7d1e084adc1033a804050a82a697b80321a83c33"

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
