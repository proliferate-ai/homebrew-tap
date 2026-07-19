cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.44"
  sha256 arm:   "d33091fab35f3aa745440f3b6f53dabe02a0012ba42e207b637a15020241d041",
         intel: "933a14f329c5aaa77db263a4f1446fbe85d0238dec1d1e8255e6eaf7265c08cf"

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
