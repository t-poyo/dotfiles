#!/bin/bash

set -ux

### Visible directories
chflags nohidden ~/Library
sudo chflags nohidden /Volumes

### Keyboard

# enable fullkeyboad access
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# input speed up
defaults write NSGlobalDomain KeyRepeat -int 2
# shorten time to repat same key
defaults write NSGlobalDomain InitialKeyRepeat -int 12

### Trackpad

# enable `Tap to click`
defaults write -g com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# siraberu function
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# speed of cursor
defaults write -g com.apple.trackpad.scaling -float 3.0
# TODO set click strength 'Light'

### General

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder AppleShowAllFiles YES
defaults write NSGlobalDomain com.apple.springing.delay -float 0
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# disable file-opening-aimation
defaults write NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSWindowResizeTime -float 0.005
defaults write com.apple.CrashReporter DialogType -string "none"
# dont make. DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# disable alert when opening DLed file
# defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

defaults write com.apple.dock static-only -boolean true

### Disable functions
defaults write com.apple.dashboard mcx-disabled -bool true # Dashboard
# TODO- enable spotlight

### Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true # Title bar shows full path
defaults write com.apple.finder AnimateWindowZoom -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf" # Search current directory by default
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder ShowStatusBar -bool true

### Safari
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari ShowStatusBar -bool true

killall Finder
killall Dock
