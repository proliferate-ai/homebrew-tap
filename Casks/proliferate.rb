cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.46"
  sha256 arm:   "50aa30682ad5217b2160514ae59e7ac41308fb47fdc4de28306b94ab30d91f0d",
         intel: "c71bebf963c9048b22ab0e2f5371b85c9c9af5882b5c0d5b3d9e60367428b7a2"

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
