cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.30"
  sha256 arm:   "f3c32d86f491818396d639fc0ec12902a8c18444573f3a9bd5a255a4bad85425",
         intel: "7199e8294b377de61dd0cd4382054972c36b0e09e7f2ed4ebf628c190e5ddb7d"

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
