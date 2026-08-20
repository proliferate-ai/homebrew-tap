cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.20"
  sha256 arm:   "e818bb86c8856f6fe3311b61f06085dd3ed36ea74495042f5fa533122c859930",
         intel: "95eff1aa2f87afcfddb9a9a48a44d512c067b0eafe95313364eded21204d6edd"

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
