class Opengrep < Formula
  desc "Ultra-fast static analysis tool for searching code patterns across 30+ languages"
  homepage "https://github.com/opengrep/opengrep"
  version "1.2.0"
  
  if Hardware::CPU.arm?
    url "https://github.com/opengrep/opengrep/archive/refs/tags/v1.11.4.tar.gz"
    sha256 "4a48c655fbfa12686b87d8dfb2b31271c44f81856dd18e60fd1805b1c0ce5824"
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
