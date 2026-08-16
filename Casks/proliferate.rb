cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.13"
  sha256 arm:   "b7b50a486b35aa625fca0a6fb1337b418b154d716bf9a7c42f4266f46976ce9d",
         intel: "0a953cf66c5a8f39b9d27f595c44bca06cca8a89fb57b1a739af50afad798c35"

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
