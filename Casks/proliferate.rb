cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.27"
  sha256 arm:   "46e6a621c29cd50cc9cfca4791c86cfd5742147922d744f7ed93c815822cd5f1",
         intel: "2609a6ad53fe590cae3df3338bf43da562a7b48c8ce3caf2f6013865692f7d4c"

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
