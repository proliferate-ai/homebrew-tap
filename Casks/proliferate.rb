cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.18"
  sha256 arm:   "4606a093a288a6de1587e4b05552a581dc4b624a7c1f019285299f3e073737cf",
         intel: "da1040a849b1f2ce6eadf5ae78a8a18b1eb45248d2e55a1259bd9292e45e6a97"

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
