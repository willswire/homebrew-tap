class Teemoji < Formula
  desc "Like tee but with emojis 🍵"
  homepage "https://github.com/willswire/teemoji"
  url "https://github.com/willswire/teemoji/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "360879396ff53781a361236e9fc16bff2178301505092c712862db4de3502c05"
  license "MIT"

  depends_on xcode: [">= 16.2", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox"
    
    # Explicitly install only the files you actually need
    libexec.install ".build/release/teemoji", ".build/release/teemoji_teemoji.bundle"
    
    # Create a thin wrapper in bin
    bin.write_exec_script libexec/"teemoji"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/teemoji --help")
    assert_predicate libexec/"teemoji", :exist?
  end
end
