class Umoci < Formula
  desc "Modifies Open Container images"
  homepage "https://umo.ci/"
  url "https://github.com/opencontainers/umoci/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "394b79fb382746e3a456bae5966d7b6b7c4bae406efdb1e7ba0bd09e7a652762"
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
