this fork was taken from somewhere just cant find the it now

# Radio-List for FiveM

The Radio-List is a specialized FiveM resource created for servers using QBCore and ESX frameworks. It introduces an immersive and dynamic radio channel list that players can interact with, allowing them to see who is currently on the same radio channel in-game, enhancing the role-playing experience.

Preview and Installation [YouTube Link](https://youtu.be/YOUR_LINK_HERE)
Team Discord [Join Here](https://discord.gg/YOUR_DISCORD_LINK)

## Features

- **Dynamic Player List**: View all players currently connected to the same radio channel.
- **Framework Compatibility**: Supports ESX and QBCore frameworks to retrieve and display players' RP names.
- **Immersive Role-Play**: Allows players to use their RP names for in-game communication.
- **UI Customization**: Players can customize the visibility and appearance of the radio list UI.

## Installation

1. **Download the Resource**: Clone this repository or download the ZIP file and extract it into your server's `resources` folder.
   
2. **Configure the Server**: Add `ensure radio-list` after `ensure qb-core` and any dependencies in your `server.cfg`.

3. **Restart the Server**: Ensure that you restart your FiveM server to apply the changes.

## Configuration

After installation, configure the Radio-List by editing the `config.lua` file:

- `UseRPName`: Set to `true` to use RP names from your server's framework.
- `LetPlayersChangeVisibilityOfRadioList`: Allows players to toggle the UI on or off.
- `RadioListVisibilityCommand`: The command players can use to change the radio list's visibility.

## Support

For support, join our Discord or create an issue on the GitHub repository. Our team is always ready to assist you.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.
