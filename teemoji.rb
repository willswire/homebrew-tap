class Teemoji < Formula
  desc "Like tee but with emojis 🍵"
  homepage "https://github.com/willswire/teemoji"
  url "https://github.com/willswire/teemoji/releases/download/v0.0.4/teemoji.tar.gz"
  sha256 "c3d7ca2a459a43b0884efbb491d544049bd39040cf391de0cce63579cd12285b"
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
