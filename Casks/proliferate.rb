cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.2"
  sha256 arm:   "44f4b5b348fa1b5faac06a08532443d62a280d3824869ab22881ba1caf03e68c",
         intel: "cf85cd51cfd70694f0afd5b779d4f1cfddb783dd98ed9860e49731eb62f54391"

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
