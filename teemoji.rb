class Teemoji < Formula
  desc "Like tee but with emojis 🍵"
  homepage "https://github.com/willswire/teemoji"
  url "https://github.com/willswire/teemoji/releases/download/v0.0.5/teemoji.tar.gz"
  sha256 "e32fde63b1a26968cd8b0ad8f899c0eee025d82c52f304a67a9823fe05d82b37"
  license "MIT"

  depends_on macos: :big_sur

  def install    
    # Explicitly install only the files you actually need
    libexec.install "teemoji", "teemoji_teemoji.bundle"
    
    # Create a thin wrapper in bin
    bin.write_exec_script libexec/"teemoji"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/teemoji --help")
    assert_predicate libexec/"teemoji", :exist?
  end
end
