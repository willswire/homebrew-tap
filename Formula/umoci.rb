class Umoci < Formula
  desc "Modifies Open Container images"
  homepage "https://umo.ci/"
  url "https://github.com/opencontainers/umoci/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "e93f0ef10c77ee9f0ed63c7b8995cbf0796579559f24d754faad3d6f35a94aa2"
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
