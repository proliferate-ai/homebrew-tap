cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.41"
  sha256 arm:   "8e6b6496707143344a94eccfe92b7a3f77695cdb4ea46e1bf7bc4a28e6a40853",
         intel: "ab083da8b77fbbcd2c344a6270737d07fc4ff4a03d7445683918c440465dcd9c"

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
