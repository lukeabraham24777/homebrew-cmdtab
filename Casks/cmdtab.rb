cask "cmdtab" do
  version :latest
  sha256 :no_check

  url "https://www.cmd-tab.com/CmdTab.dmg"
  name "Cmd+Tab"
  desc "Switcher where apps and individual browser tabs are peers in one list"
  homepage "https://www.cmd-tab.com/"

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
