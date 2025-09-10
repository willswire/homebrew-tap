# Formula for Oracle Instant Client Tools
class InstantclientTools < Formula
  desc "Oracle Instant Client Tools"
  homepage "https://www.oracle.com/database/technologies/instant-client/downloads/index.html"
  
  if Hardware::CPU.arm?
    url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-tools-macos.arm64-23.3.0.23.09.dmg"
    sha256 "73d29259faf74ab237b7340950a323a7dae2c0562c6722292c0cf0eea222e478"
  else
    url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-tools-macos.x64-19.8.0.0.0dbru.zip"
    sha256 "d711451996a916af6880643a78f4afe0fad7979a8e020459580a78989e6ec5d5"
  end
  
  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."
  
  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")
  
  conflicts_with "instantclient-arm64-tools" do
    because "this formula now handles both architectures"
  end
  
  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      ["exp", "expdp", "imp", "impdp", "sqlldr", "wrc"].each do |tool|
        system DevelopmentTools.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", tool
      end
    end
    
    lib.install Dir["*.dylib"]
    bin.install ["exp", "expdp", "imp", "impdp", "sqlldr", "wrc"]
    
    if MacOS.version >= :catalina
      bin.env_script_all_files(libexec, "DYLD_LIBRARY_PATH" => HOMEBREW_PREFIX/"lib")
    end
  end
  
  test do
    assert_predicate bin/"sqlldr", :exist?
  end
end
