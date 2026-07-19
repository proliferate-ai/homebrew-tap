cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.42"
  sha256 arm:   "a07e740cb762e7c0fb3158affd73f7d30ca0dae701597aacf00afb1d40e224e9",
         intel: "07dbbdd4c03bccdff87c478b74a71676ee6fb7e6746b3637c8208aa38010aeef"

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
