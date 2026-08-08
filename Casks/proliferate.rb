cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.8"
  sha256 arm:   "8f21acf86d19034ed09e69e5a346e8f8a01badcd90f78a4705452d3bf3fb9dfd",
         intel: "dcb23b1df72e498061ab7a55d084c53dcff7d1829d1752295f425fcc42e1818e"

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
