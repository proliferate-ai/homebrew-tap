cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.49"
  sha256 arm:   "6900fae02cafb87367ac4b995da604c6eb5d3666646cc0cfc3f96874be225fa4",
         intel: "38f0a0014ff248590233ef874019bae6e0bb6caf1ecd36c5f3c739a8a00fdcd7"

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
