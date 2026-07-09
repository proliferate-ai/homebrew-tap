cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.13"
  sha256 arm:   "edcec0c84e3bbff0709ec6bf45e2748107a6a0c17f2c5f0a4b1e77d97be99d51",
         intel: "4c40c91931398a2358bdcd552148430ae9d189a6b0146d2965e2e1f1837d3595"

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
