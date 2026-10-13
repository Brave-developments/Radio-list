# Changelog

## [fix] - 2026-10-07

### Fixed
- Guarded PlayersInRadio[src] lookups against missing keys; player names now fall back to GetPlayerName.
- Hoisted channelName computation out of the member loop and removed the dedented shadowing local.
