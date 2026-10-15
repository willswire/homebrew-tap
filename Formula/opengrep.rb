class Opengrep < Formula
  desc "Ultra-fast static analysis tool for searching code patterns across 30+ languages"
  homepage "https://github.com/opengrep/opengrep"
  version "1.2.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/opengrep/opengrep/archive/refs/tags/v1.31.0.tar.gz"
    sha256 "fa01344a0cdafbe866f34c2b62a07a4733050ee43f0bd992ecf27704bf56cb83"
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
