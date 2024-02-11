Radio-List for FiveM


Radio-List is an innovative Lua script tailored for FiveM role-playing (RP) servers, designed to elevate in-game communication. By introducing a dynamic and interactive radio channel list, this script showcases the names of players engaged in radio communication, providing a realistic and immersive RP experience. Compatible with both ESX and QB-Core frameworks, Radio-List bridges the gap between gameplay and storytelling by integrating players' role-play or in-game names into radio interactions.

Key Features
Dynamic Radio Channel Listings: Automatically updates to display players connected to specific radio channels.
Framework Compatibility: Works seamlessly with ESX and QB-Core, fetching RP names directly from these frameworks.
Enhanced Role-Play Immersion: Allows for the use of character names in radio communications, deepening the role-play experience.
Customizable Settings: Offers flexible configuration options, including toggles for RP names and UI visibility.
Player-Controlled UI: Players can adjust the visibility of the radio list and set custom display names for added personalization.
Installation Guide
Prerequisites
Ensure your FiveM server is running with either ESX or QB-Core installed and properly configured.

Steps
Download: Obtain the latest version of the Radio-List script from the official repository.
Installation: Unzip the downloaded package into your resources directory located within the FiveM server installation path.
Configure: Access the config.lua file within the Radio-List folder to tweak settings like RP name usage, UI visibility, and more according to your preference.
Server Configuration: Add ensure radio-list to your server's server.cfg file to ensure the script is loaded at server start.
Restart: Apply changes by restarting your FiveM server or by starting the Radio-List resource via the server console command.
Configuration
Tailor the Radio-List script to meet your server's specific needs through the config.lua file. Important configuration options include:

UseRPName: Determines whether players' RP names (true) or their game names (false) are used in the radio list.
LetPlayersChangeVisibilityOfRadioList: Enables players to toggle the visibility of the radio list UI.
RadioListVisibilityCommand: Sets the in-game command for toggling the radio list UI's visibility.
LetPlayersSetTheirOwnNameInRadio: Allows players to customize how their names appear in radio communications.
Usage
With Radio-List activated, players will see an updated list of names on their screen for the radio channel they are tuned into. Commands provided in the config.lua file enable further interaction, such as changing display names or toggling the list's visibility.

Contributing
We welcome contributions, including bug fixes, feature suggestions, and code improvements. Feel free to submit pull requests or create issues on the repository for any contributions you wish to make.

License
Radio-List is released under the MIT License. For more details, please refer to the LICENSE file included in the package.

Support
Should you encounter any issues or have questions regarding the Radio-List script, please do not hesitate to submit an issue on the GitHub repository or reach out to the development team for assistance.

