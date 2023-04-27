echo -e "🚀 running"

# Ask for the administrator password up front
sudo -v


# ==========
echo -e "\n🍻 brew (be patient)"
# ==========

# Homebrew: Update or install brew
brew update || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install useful formulae
# brew install \
  # node@14 \
  # nikto \
  # wget \
  # git \
  # go \
  # awscli \
  # jq \
  # phantomjs \
  # openjdk \
  # yarn \

# Install useful applications
# brew install --cask \
  # 1password \
  # docker \
  # dropbox \
  # google-chrome \
  # hand-mirror \
  # iterm2 \
  # mullvadvpn \
  # numi \
  # pika \
  # plex-media-server \
  # signal \
  # slack \
  # spotify \
  # the-unarchiver \
  # transmission \
  # visual-studio-code \
  # vlc \
  # zoom \

# Remove outdated versions from the cellar
brew cleanup


# ==========
echo -e "\n💻 app prefs"
# ==========

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Disable the all too sensitive backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false


# ==========
echo -e "\n🍏 system prefs"
# ==========

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Trackpad/Mouse: set tracking speed
defaults write -g com.apple.mouse.scaling 3
defaults write -g com.apple.trackpad.scaling 3

# Trackpad/Mouse: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Use scroll gesture with the Ctrl (^) modifier key to zoom
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

# Follow the keyboard focus while zoomed in
sudo defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid creating .DS_Store files on network, USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Finder window default view style
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
defaults write com.apple.Finder FXPreferredViewStyle clmv

# Finder window default folder path
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
defaults write com.apple.finder NewWindowTarget -string 'PfHm'

# Hide external disks on the desktop
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool false

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Set the icon size of Dock items to x pixels
defaults write com.apple.dock tilesize -int 40

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Set hover-to-show delay to 0
defaults write com.apple.dock "autohide-delay" -int 0

# Speed up dock-show animation
defaults write com.apple.dock "autohide-time-modifier" -float 0.4

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
# Top left screen corner → Put display to sleep
defaults write com.apple.dock wvous-tl-corner -int 10
defaults write com.apple.dock wvous-tl-modifier -int 0
# Top right screen corner → Disable screen saver
defaults write com.apple.dock wvous-tr-corner -int 6
defaults write com.apple.dock wvous-tr-modifier -int 0
# Bottom left screen corner → no-op
defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0
# Bottom right screen corner → no-op
defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Set date/time format
# https://www.tech-otaku.com/mac/setting-the-date-and-time-format-for-the-macos-menu-bar-clock-using-terminal/
defaults write com.apple.menuextra.clock DateFormat -string "h:mm"

# Show bettery percentage in menu
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Turn on dark mode
osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true"

# Disable user interface sound effects
defaults write com.apple.systemsound "com.apple.sound.uiaudio.enabled" -int 0


# ==========
echo -e "\n🧰 terminal setup"
# ==========

# use zsh as default shell if it's not already
[ "$SHELL" != "/bin/zsh" ] && chsh -s $(which zsh)

# Snazzy theme
# https://github.com/sindresorhus/terminal-snazzy
# curl -sL --remote-name https://github.com/sindresorhus/terminal-snazzy/raw/main/Snazzy.terminal
# open Snazzy.terminal
# osascript -e 'tell application "Terminal" to set default settings to settings set "Snazzy"'
# rm Snazzy.terminal

# Custom iTerm2 preferences are already in the root directory and include Snazzy theme
# http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "https://raw.githubusercontent.com/alitorbati/dotfiles/main/com.googlecode.iterm2.plist"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Kill System UI for some of these changes to take affect
killall SystemUIServer


# ==========
# \e[32m means green, \e[0m means reset color
echo -e "\n✨ \e[32mall done \e[0m✨ please \e[33mrestart\e[0m for good measure\n"
# ==========
