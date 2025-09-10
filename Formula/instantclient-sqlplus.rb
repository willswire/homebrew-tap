# Formula for Oracle Instant Client SQL*Plus
class InstantclientSqlplus < Formula
  desc "Oracle Instant Client SQL*Plus"
  homepage "https://www.oracle.com/database/technologies/instant-client/downloads/index.html"
  
  if Hardware::CPU.arm?
    url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-sqlplus-macos.arm64-23.3.0.23.09.dmg"
    sha256 "9213a399a13101bdebcd613027fa385ef44c42bba2330f9480b16db0e1a7d676"
  else
    url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-sqlplus-macos.x64-19.8.0.0.0dbru.zip"
    sha256 "d3cba88b0a0a3d9993c4b64b611569d146cdf36ec55dd84eba4783517bd30959"
  end
  
  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."
  
  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")
  
  conflicts_with "instantclient-arm64-sqlplus" do
    because "this formula now handles both architectures"
  end
  
  def install
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
    
    # Always use environment wrapper to ensure proper library loading
    # This preserves code signing by not modifying the binary
    bin.env_script_all_files(libexec, "DYLD_LIBRARY_PATH" => HOMEBREW_PREFIX/"lib")
  end
  
  test do
    assert_predicate bin/"sqlplus", :exist?
    output = shell_output("#{bin}/sqlplus -V 2>&1", 1)
    assert_match(/SQL\*Plus: Release/, output)
  end
end
