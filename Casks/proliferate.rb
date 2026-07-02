cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "a8451f16103d3076472714e7a2f2e931a41f09c4a1d6d83469d04b1f1b7c23e2",
         intel: "e6657d4128aebf92140516610ada9530ec0209e74770f32b598c85979977b75e"

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
