cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.12"
  sha256 arm:   "269b1a6f112837349d012289ea76718973bf4770ba0d449d5372c1481242aa54",
         intel: "1b9a1dbdb362345ec473f541ab71b3162071583a4f4df6069a733fd611b2c0e8"

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
