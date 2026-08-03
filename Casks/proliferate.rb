cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.1"
  sha256 arm:   "bd48ae5f651df3540b1445c89187ea2959282aa41b1a3e35bc4ce94e61c9407a",
         intel: "0fc5acb845aa592d159c42f3bddae7b2b862f9ac9d1ce54089f63695c341aa6d"

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
