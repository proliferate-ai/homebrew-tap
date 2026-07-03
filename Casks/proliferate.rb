cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.4"
  sha256 arm:   "0866d69f6a166f0405900a35c7b41de8e4b6b87a31a19926699add6b67e0887c",
         intel: "b078cad27da057682a456c0f6cec8ea2627ce84a4cba8905e39151a364d25a21"

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
