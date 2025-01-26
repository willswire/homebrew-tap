class Teemoji < Formula
  desc "Like tee but with emojis 🍵"
  homepage "https://github.com/willswire/teemoji"
  url "https://github.com/willswire/teemoji/releases/download/v0.0.1/teemoji.tar.gz"
  sha256 "a0280b65388acfd25fa85e2130cfa31a7926108205fb7611ea71b9842153c1d4"
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
