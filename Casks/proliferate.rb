cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.15"
  sha256 arm:   "fa9c94fb60b8acbcfc9f22d99bb7b91f56f789158b1e3b8480e6c236b23dba2b",
         intel: "b0b654552211e724b59046bb9a5362b3a2fbf9f19a60a91c70ba470a8812c29a"

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
