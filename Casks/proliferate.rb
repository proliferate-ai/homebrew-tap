cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.3.17"
  sha256 arm:   "288e62ab1df2dd17a34dfbdcdcca50693467d74ea8e8284f1181f65a7838e523",
         intel: "2fff108b391fc9ba871ef1342f897285ba8a0ed8006dbfc7b5cc87871dd2986d"

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
