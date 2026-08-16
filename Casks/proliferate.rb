cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.14"
  sha256 arm:   "c51bafbc78c9bdc1bdf81576df65d1a01df52a0ba5d9f823b5f6038064594562",
         intel: "b2ae363e2ee61f83fb9ac732b0268eeb0974a1555b322a913852154f5765af84"

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
