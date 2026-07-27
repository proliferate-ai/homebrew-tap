cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.50"
  sha256 arm:   "855dd653c9004a81ae4db53f149cf76cbdcfa2e77e0fc21e419c74a2a3d96de1",
         intel: "a6e0184adec23a378cb7414a19a3221c7d1825ab23171b394b53169a9f3ab574"

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
