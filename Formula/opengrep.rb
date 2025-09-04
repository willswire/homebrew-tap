class Opengrep < Formula
  desc "Ultra-fast static analysis tool for searching code patterns across 30+ languages"
  homepage "https://github.com/opengrep/opengrep"
  version "1.2.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/opengrep/opengrep/archive/refs/tags/v1.9.1.tar.gz"
    sha256 "b027bfbd4cd5542ac0040aa22eb664dc7dcef9e5d753fb565e975330dc36a99a"
  elsif Hardware::CPU.intel?
    url "https://github.com/opengrep/opengrep/releases/download/v1.2.0/opengrep_osx_amd64"
    sha256 "replace_with_actual_intel_checksum"
  end
  
  license "LGPL-2.1-only"

  def install
    bin.install Dir["*"].first => "opengrep"
  end

  test do
    assert_match "#{version}", shell_output("#{bin}/opengrep --version 2>&1")
  end
end
