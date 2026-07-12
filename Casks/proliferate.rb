cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.26"
  sha256 arm:   "d8f229ab703d826af89d922f5b52108d35d794f53c0ba5c25ae61833912d0d0d",
         intel: "188196fdddbf32e4bd368cc32be44f9ccb251a12bdf12c1c4672bd67014892c6"

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
