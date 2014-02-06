Snapstore
=========

tl;dr: A MobileSubstrate tweak for Snapchat to enable saving of images, disable image expiry counters, and disable screenshot notifications.

Instructions
============

1. Install and configure Theos (http://iphonedevwiki.net/index.php/Theos/Getting_Started)
2. Clone repo and run 'make package'
3. Copy .deb to iOS device
4. Run 'dpkg -i packagename.deb'
5. Terminate and restart any running instances of Snapchat
6. Configure tweak options in iOS Settings
7. Profit!

Notes
=====

1. This is not an "exploit" for Snapchat - Snapchat is not "broken", it's runtime has been modified. There's a big difference here. 
2. Works only on jailbroken devices
3. Requires PreferenceLoader to installed on the device
4. Use at your own risk!
