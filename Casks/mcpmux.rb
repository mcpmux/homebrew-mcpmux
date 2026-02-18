cask "mcpmux" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "6969dca5027294811bae8d058d72d46e3573a0d74a1590d2123b6eadc086772f",
         intel: "497d1deb01d114d867ecd39eb47b1c8812974c371fda2f91e17ccb32e7dc7b23"

  url "https://github.com/mcpmux/mcp-mux/releases/download/v#{version}/McpMux_#{version}_#{arch}.dmg",
      verified: "github.com/mcpmux/mcp-mux/"

  name "McpMux"
  desc "Unified MCP gateway and manager for AI clients"
  homepage "https://mcpmux.com"


  livecheck do
    url "https://github.com/mcpmux/mcp-mux/releases/latest"
    strategy :github_latest
  end

  app "McpMux.app"

  # Remove quarantine for ad-hoc signed app (no Apple Developer ID)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/McpMux.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.mcpmux.desktop",
    "~/Library/Preferences/com.mcpmux.desktop.plist",
    "~/Library/Caches/com.mcpmux.desktop",
    "~/Library/Saved Application State/com.mcpmux.desktop.savedState",
  ]
end
