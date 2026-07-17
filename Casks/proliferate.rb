cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.38"
  sha256 arm:   "47e5788050cca2d5134752f59257b72866d9a4b396ebdbac82a88d858f238844",
         intel: "2327bd64058ac17ee0e630e113d78c9f4ab77770992d5f2764b9d4281f1f41f1"

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
