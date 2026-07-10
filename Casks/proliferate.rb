cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.21"
  sha256 arm:   "1166c4247f0758ba98ac56bc95ce2685db5bf6e79f242b2705ffbf3b7e0fe93c",
         intel: "dda1392b57c3f6d87c4a5b64993d1bbf31c7cc5b2abe42dd8a6713182dc58f11"

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
