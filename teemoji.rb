class Teemoji < Formula
  desc "Like tee but with emojis 🍵"
  homepage "https://github.com/willswire/teemoji"
  url "https://github.com/willswire/teemoji/releases/download/v0.0.3/teemoji.tar.gz"
  sha256 "27280da33efc69d58b609702ccc42abc4ac436cdfc25fb4b3a2712011a7ed4c6"
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
