#!/bin/bash

printf "hi, this bash script is for changing some macos settings, and is located at:\n$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )\nplease edit this to your preferences.\n\nnote that some settings need to be refreshed later by logging out and back in later.\n"
read -p "if you have already carefully edited this bash script, input y to run. " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

# this feature lets you move windows by holding control+command and dragging any part of window
defaults write -g NSWindowShouldDragOnGesture -bool true

# hot corners
# possible values:
#  0: none
#  2: mission control
#  3: show application windows
#  4: desktop
#  5: start screen saver
#  6: disable screen saver
#  7: dashboard
# 10: put display to sleep
# 11: launchpad
# 12: notification center
## top left screen corner → 0
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0
## top right screen corner → 2
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0
## bottom left screen corner → 10
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0
## bottom right screen corner → 11
defaults write com.apple.dock wvous-br-corner -int 11
defaults write com.apple.dock wvous-br-modifier -int 0




# trackpad
## map bottom right trackpad corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
## enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1



# keyboard
# use https://mac-key-repeat.zaymon.dev/ for key delay and repeat speed testing
## key repeat initial delay
defaults write -g InitialKeyRepeat -int 10
## key repeat speed
defaults write -g KeyRepeat -int 2
## cursor movement speed
defaults write NSGlobalDomain KeyRepeat -int 5
## disable auto capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
## disable "smart" dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
## disable automatic period substitutions
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
## disable smart quotes 
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
## disable autocorrect
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
## function keys (F1, F2 etc) behave as function keys - hold down "fn" to use special functions
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true



# dock
## disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false
## autohide
defaults write com.apple.Dock autohide -bool true
## autohide speed
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide-time-modifier -float 0.3
## position
defaults write com.apple.dock "orientation" -string "right"
## dock icon size
defaults write com.apple.dock "tilesize" -int 36
## hide recents
defaults write com.apple.dock "show-recents" -bool false
## window minimize animation - "scale" or "genie"
defaults write com.apple.dock "mineffect" -string "scale"
## enable file drag and drop to dock spring loading
defaults write com.apple.dock "enable-spring-load-actions-on-all-items"
## disable animations when you open an application from the Dock
defaults write com.apple.dock launchanim -bool false
## disable delay when you hide the Dock
defaults write com.apple.dock autohide-delay -float 0
## change mission control animation speed and when switching desktops
defaults write com.apple.dock expose-animation-duration -float 0
## launchpad: apps rows and columns
defaults write com.apple.Dock springboard-rows -int 10
defaults write com.apple.Dock springboard-columns -int 13
## launchpad show/hide duration
defaults write com.apple.dock springboard-show-duration -float .1
defaults write com.apple.dock springboard-hide-duration -float .1
## launchpad page-flip duration
defaults write com.apple.dock springboard-page-duration -float .1
## make dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true
## enable iTunes/music.app track notifications in the Dock
defaults write com.apple.dock itunes-notifications -bool true
## show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true
## disable automatically rearrange spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false



# finder
# hide bottom status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool false
# folders on top when sorting by name
defaults write com.apple.Finder _FXSortFoldersFirst -bool true
# enable quitting finder and show "quit" menu item
defaults write com.apple.finder "QuitMenuItem" -bool true
# show path bar
defaults write com.apple.finder ShowPathbar -bool true
# show all file extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool true
# show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool true
# do not show warning when changing file extensions
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool false
# do not use iCloud as default file storage destination
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool false
# remove delay when hovering title
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float 0
# finder search only searches in current directory by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# disable empty trash sound
defaults write com.apple.Finder FinderSounds -bool false
# display full POSIX path as Finder window title
defaults write com.apple.Finder _FXShowPosixPathInTitle -bool true
# disable animation when opening the Info window in Finder
defaults write com.apple.Finder DisableAllAnimations -bool true
# hide internal hard drives on desktop
defaults write com.apple.Finder ShowHardDrivesOnDesktop -bool false
# hide external hard drives on desktop
defaults write com.apple.Finder ShowExternalHardDrivesOnDesktop -bool false
# hide removable media on desktop
defaults write com.apple.Finder ShowRemovableMediaOnDesktop -bool false
# hide mounted servers on desktop
defaults write com.apple.Finder ShowMountedServersOnDesktop -bool false
# disable the warning when emptying trash
defaults write com.apple.Finder WarnOnEmptyTrash -bool false
# empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true
# allow text selection in quick look
defaults write com.apple.finder QLEnableTextSelection -bool true







# safari and mail


## disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
## enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
## make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false   
## add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# change the Safari search to find strings contained in other words
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
# show developer tools
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# disable webkit start page
defaults write org.webkit.nightly.WebKit StartPageDisabled -bool true
# set Safari's home page to 'about:blank' for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"
# prevent Safari from opening 'safe' files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
# auto clear downloads
defaults write com.apple.Safari DownloadsClearingPolicy -int 2
# don't fill passwords
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -int 0
# show full URL in Safari
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
# show status bar
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write com.apple.Safari ShowStatusBarInFullScreen -bool true
# show scroll bar: Always, Automatic, WhenScrolling
defaults write -g AppleShowScrollBars -string "WhenScrolling"
# disable mail sending animations
defaults write com.apple.mail DisableReplyAnimations -bool true
defaults write com.apple.mail DisableSendAnimations -bool true
# copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>`
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false






















# misc

# disable animations when opening a Quick Look window
defaults write -g QLPanelAnimationDuration -float 0
# disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
# automatically open a new finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
# disable animations when opening and closing windows
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# show remaining battery time and percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"
# enable airdrop for ethernet
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
# disable "Application Downloaded from Internet" popup
defaults write com.apple.LaunchServices "LSQuarantine" -bool false
# disable .DS_Store creation for network and external drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# expand the options for "save" and "print" dialogues
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true
# require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
# only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4
# show the ~/Library folder
chflags nohidden ~/Library
# use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# ppen and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# open an empty file directly
defaults write com.apple.TextEdit NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false
# force files to open in new windows instead of new tabs
defaults write com.apple.TextEdit AppleWindowTabbingMode -string manual
# set plain text font size
defaults write com.apple.TextEdit NSFixedPitchFontSize -int 16
# stop reminders from grouping by time of day
defaults write "$HOME/Library/Group Containers/group.com.apple.reminders/Library/Preferences/group.com.apple.reminders" todayListIsGrouped -bool false
# disable app store notifications
defaults write com.apple.appstored LastUpdateNotification -date "2029-12-12 12:00:00 +0000"
# sort users in contacts by first name
defaults write -app Contacts ABNameSortingFormat -string "sortingFirstName sortingLastName"
# apple calender number of hours displayed
defaults write com.apple.iCal "number of hours displayed" -int 16
# make power button not able to put mac to sleep
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool false
# save screenshots to downloads
defaults write com.apple.screencapture location -string "~/Desktop"
# save screenshots in format (options: PNG, BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "jpg"
# screenshot don't show iOS like screenshot thumbnail
defaults write com.apple.screencapture show-thumbnail -bool false













# restart finder
killall Finder
# restart dock
killall Dock












printf "note that you need to log out and log in again for these settings to refresh.\n"
read -p "there are more settings that require sudo. input y to run them. " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1








# prompt password and enable sudo
sudo -v





# updates

## check for software updates once every year 
sudo defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 365

## disable auto update and download
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false




# to stop the display from half dimming before full display 'sleep'
sudo pmset -a halfdim 0

# Sleep options
sudo pmset -a displaysleep 5

# Wake for network access
sudo pmset -a womp 1

# restart after power failure
sudo pmset -a autorestart 1

# wake computer when laptop is opened
sudo pmset -a lidwake 1

# don't wake computer when power source changes
sudo pmset -a acwake 0

# don't dim brightness on different sources
sudo pmset -a lessbright 0


#

# reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# slience boot sound
sudo nvram SystemAudioVolume=" "

