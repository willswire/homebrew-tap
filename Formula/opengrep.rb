class Opengrep < Formula
  desc "Ultra-fast static analysis tool for searching code patterns across 30+ languages"
  homepage "https://github.com/opengrep/opengrep"
  version "1.2.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/opengrep/opengrep/archive/refs/tags/v1.16.0.tar.gz"
    sha256 "a67b5c195f3f51b05bd7befb8b5da9f969db9b643f7f38759bc4516fa755a11e"
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
