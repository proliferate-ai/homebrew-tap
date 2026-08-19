cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.18"
  sha256 arm:   "13910a36aadbd43f9ef37ad42df5acc4e2e95aaa595c27a234cb305ab3994232",
         intel: "20df2a3d79014663909674f4f66b694913144324b59909c0a4bf3145cf0d4a18"

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
