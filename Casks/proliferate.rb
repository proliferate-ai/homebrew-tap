cask "proliferate" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.10"
  sha256 arm:   "0f4ea17cf00905741850d4be507a689561ee70b17f4e15897e27df134ff22a99",
         intel: "4b10dc13d8585009d8c179816e5ec8eda72b2c9ccad34fd49559f80b61d56a06"

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
