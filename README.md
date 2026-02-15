# Homebrew Tap for McpMux

Homebrew cask for installing [McpMux](https://github.com/mcpmux/mcp-mux) — the unified MCP gateway and manager for AI clients.

## Installation

```bash
brew tap mcpmux/mcpmux
brew install --cask mcpmux
```

## Updating

```bash
brew upgrade --cask mcpmux
```

## Uninstalling

```bash
brew uninstall --cask mcpmux
```

## Note on Gatekeeper

McpMux is currently distributed without Apple Developer ID signing. The cask automatically removes the macOS quarantine attribute during installation so the app opens without Gatekeeper warnings.
