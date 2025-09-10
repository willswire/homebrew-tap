# Formula for Oracle Instant Client ODBC
class InstantclientOdbc < Formula
  desc "Oracle Instant Client ODBC"
  homepage "https://www.oracle.com/database/technologies/instant-client/downloads/index.html"
  
  if Hardware::CPU.arm?
    url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-odbc-macos.arm64-23.3.0.23.09.dmg"
    sha256 "273a12747ee6241ef4f5c75710bc56ce981a3538ce661607ff02e4773280d8dd"
  else
    url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-odbc-macos.x64-19.8.0.0.0dbru.zip"
    sha256 "4bafb93f875a2bffa75f0a0798e923e032241edc1dccee463a408223ad766d16"
  end
  
  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."
  
  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")
  
  conflicts_with "instantclient-arm64-odbc" do
    because "this formula now handles both architectures"
  end
  
  def install
    lib.install Dir["*.dylib*"]
    (HOMEBREW_PREFIX/"etc").mkpath
    (HOMEBREW_PREFIX/"etc").install "odbc.ini" if File.exist?("odbc.ini")
  end
  
  test do
    assert_predicate lib/"libsqora.dylib", :exist?
  end
end
