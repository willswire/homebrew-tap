class Wifiman < Formula
  desc "WiFiMan Desktop"
  homepage "https://desktop.wifiman.com"
  version "1.1.3"
  url "https://desktop.wifiman.com/wifiman-desktop-#{version}-arm64.pkg"
  sha256 "cedb1e12544422f2a1f26f96af0fad11b360658295182b4023f1b28ac5297a46"

  depends_on :macos

  def install
    system "pkgutil", "--expand-full", "wifiman-desktop-#{version}-arm64.pkg", "expanded"
    prefix.install Dir["expanded/WifimanDesktop.pkg/Payload/WiFiman Desktop.app"]
    prefix.install Dir["expanded/WiFimanNetworkHelper.pkg/Payload/WiFiman Companion.app"]
  end

  def caveats
    <<~EOS
      WiFiMan has been installed to:
        #{prefix}/WiFiman Desktop.app
        #{prefix}/WiFiman Companion.app
      
      You can link them into your Applications folder with:
        ln -s "#{prefix}/WiFiman Desktop.app" "/Applications/"
        ln -s "#{prefix}/WiFiman Companion.app" "/Applications/"
    EOS
  end

  test do
    assert_predicate prefix/"WiFiman Desktop.app", :exist?
    assert_predicate prefix/"WiFiman Companion.app", :exist?
  end
end