cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.10"
  sha256 arm:   "7b563c41cabccec3b8f252fc2204222cdb19b40ab67b60d6b5bab912659a0a62",
         intel: "512bcc2d2acc9cb954c112f03ddbc53f1c5a9ca86483902f52381b700076be8e"

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
