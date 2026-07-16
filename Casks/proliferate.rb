cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.36"
  sha256 arm:   "28285fca2181cbbe0acdcabddf5ffc097989f536ac57e06dbe5a3e54eb1e3b92",
         intel: "b821a984e8672980d23c232f9b575d0092ae0a21ce78855f60509d33cdfa0816"

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
