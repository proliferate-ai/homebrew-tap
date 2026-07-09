cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.14"
  sha256 arm:   "2df2033c09f569b8880cb9bf232473c4d3218e22c6c1d50cc33eee44540db92d",
         intel: "38b748f2817410471ec24927154e9dfd7874a68c5184e24de5cf47a00b5e87b7"

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
