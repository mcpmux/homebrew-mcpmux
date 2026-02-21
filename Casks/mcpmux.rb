cask "mcpmux" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.3"
  sha256 arm:   "494dbcb9fcd88f7fc6e2fabf25deba73cf12267590b0852238769935262647bf",
         intel: "7baa7a78259889b3c585a6c08d1d40dcadc3a88ecd383bb9521c3265427bd939"

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
