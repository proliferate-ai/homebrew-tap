cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.21"
  sha256 arm:   "a39fb94c00de47b8d2408ac180283a92f6d6e5cf79b369124dd83fcf3daa2ea0",
         intel: "576f0669a381dc94eb63fc49f0691dc79c7f3d2c22c89587519a7f7fda6810a2"

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
