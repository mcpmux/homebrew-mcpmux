cask "mcpmux" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.2"
  sha256 arm:   "3192e9dfd4c175969a26ae61acd613295bc83ac0d1eeba10f2ca8d8a4bac3060",
         intel: "a04f7148ce084eb126e0a80910a8fda02005107b87513a7fa97b00bda75e032b"

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
