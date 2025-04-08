class Umoci < Formula
  desc "Modifies Open Container images"
  homepage "https://umo.ci/"
  url "https://github.com/opencontainers/umoci/archive/refs/tags/v0.4.7.tar.gz"
  sha256 "c01b36de6fdc513eb65add57bc882d72f94fc3b4b65a8f9ef59826fb754af93e"
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
