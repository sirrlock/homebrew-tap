# sirrlock/homebrew-tap

Homebrew tap for Sirr — the ephemeral secret manager.

## Install

```bash
brew tap sirrlock/tap
brew install sirrlock/tap/sirrd   # Server daemon
brew install sirrlock/tap/sirr    # CLI client
```

## Formulas

| Formula | Description |
|---------|-------------|
| `sirrd` | Sirr daemon — self-hosted secret vault server |
| `sirr`  | Sirr CLI — push, get, and manage secrets from the terminal |

## Run sirrd as a background service

```bash
brew services start sirrlock/tap/sirrd
```

Set `SIRR_MASTER_KEY` in `/usr/local/etc/sirrd.env` (or `~/.config/sirrd/.env`) before starting.
