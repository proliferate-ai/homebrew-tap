cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.25"
  sha256 arm:   "28c054e702a4549cf8c38c755570d2a01c521be87d96a0dd00e8195e44c702a0",
         intel: "6958c0d22e296bde48e6c163252eda5f3d5917a767a0d33602d1fe5244b8370c"

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
