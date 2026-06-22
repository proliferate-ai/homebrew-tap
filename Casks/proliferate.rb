cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.21"
  sha256 arm:   "21cd54fadaddcb39bc11d3b6dadd58145a448f65420fe0b79ee8ed613555595a",
         intel: "203eddf03dc97a76b751827257c107d9c09683e0fb39ba8774d50938fc5b419e"

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
