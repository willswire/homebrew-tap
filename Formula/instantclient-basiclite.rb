# Formula for Oracle Instant Client Basic Lite
class InstantclientBasiclite < Formula
  desc "Oracle Instant Client Basic Lite"
  homepage "https://www.oracle.com/database/technologies/instant-client/downloads/index.html"
  
  if Hardware::CPU.arm?
    url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-basiclite-macos.arm64-23.3.0.23.09.dmg"
    sha256 "5c0fb1748594d8beff9d0bf9c410436c1b9839ca2f8cb4150f759b23d84dde5d"
  else
    url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basiclite-macos.x64-19.8.0.0.0dbru.zip"
    sha256 "82fcc280726dafad0254f31a5dc7361c8ebce18e5eb4ed676a4143dda8aab9af"
  end
  
  conflicts_with "instantclient-basic"

  
  def install
    lib.install Dir["*.dylib*"]
  end
  
  test do
    assert_predicate lib/"libclntsh.dylib", :exist?
  end
end
