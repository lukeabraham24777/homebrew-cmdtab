cask "cmdtab" do
  version "1.0.2"
  sha256 "7ee0861cf190de0f24d36f49070f58eaf6a5780cfee9bbc7ba16779b98ec7b10"

  url "https://www.cmd-tab.com/CmdTab.dmg"
  name "Cmd+Tab"
  desc "Switcher where apps and individual browser tabs are peers in one list"
  homepage "https://www.cmd-tab.com/"

  livecheck do
    url "https://www.cmd-tab.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "CmdTab.app"

  zap trash: [
    "~/Library/Application Support/CmdTab",
    "~/Library/Preferences/com.lucky.cmdtab.plist",
  ]

  caveats <<~EOS
    Cmd+Tab needs Accessibility and Input Monitoring permissions (plus
    Screen Recording for window previews); it walks you through them on
    first launch.
  EOS
end
