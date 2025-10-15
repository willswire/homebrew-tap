class Umoci < Formula
  desc "Modifies Open Container images"
  homepage "https://umo.ci/"
  url "https://github.com/opencontainers/umoci/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "400a26c5f7ac06e40af907255e0e23407237d950e78e8d7c9043a1ad46da9ae5"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    # Build the binary using make build instead of directly using go build
    system "make"
    bin.install "umoci"
  end

  test do
    # Simple test - just check if it outputs version info
    assert_match "umoci", shell_output("#{bin}/umoci --version")
  end
end
