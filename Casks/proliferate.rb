cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.51"
  sha256 arm:   "4a76774fffdcd3832e22b717eebc0464a3b7cbe450e4b88b2fb9ce41c2072a53",
         intel: "440d664f58272cd494eecd16d50df63b59ee828e920b9ed4817b97b971754ae6"

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
