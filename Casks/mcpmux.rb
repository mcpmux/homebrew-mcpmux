cask "mcpmux" do

  version "0.1.1"
  sha256 "5f26331c256ab3cd78afe586f70ee182e81150cc89573849669d2d56bae0789d"

  url "https://github.com/mcpmux/mcp-mux/releases/download/v#{version}/McpMux_#{version}_aarch64.dmg",
      verified: "github.com/mcpmux/mcp-mux/"

  name "McpMux"
  desc "Unified MCP gateway and manager for AI clients"
  homepage "https://mcpmux.com"

  depends_on macos: ">= :high_sierra"
  depends_on arch: :arm64

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
