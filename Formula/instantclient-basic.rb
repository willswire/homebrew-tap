# Formula for Oracle Instant Client Basic
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic"
  homepage "https://www.oracle.com/database/technologies/instant-client/downloads/index.html"
  
  if Hardware::CPU.arm?
    url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-basic-macos.arm64-23.3.0.23.09-1.dmg"
    sha256 "1bcddb583870f70c232d579edb8a32fd58497028a4eff1ad28ece0397ba8d7fe"
  else
    url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip"
    sha256 "57ed4198f3a10d83cd5ddc2472c058d4c3b0b786246baebf6bbfc7391cc12087"
  end
  
  conflicts_with "instantclient-basiclite"
  
  conflicts_with "instantclient-arm64-basic" do
    because "this formula now handles both architectures"
  end
  
  def install
    lib.install Dir["*.dylib*"]
  end
  
  test do
    assert_predicate lib/"libclntsh.dylib", :exist?
  end
end
