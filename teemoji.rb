class Teemoji < Formula
  desc "Like tee but with emojis 🍵"
  homepage "https://github.com/willswire/teemoji"
  url "https://github.com/willswire/teemoji/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "0ab624dfd16753fc372ea715a1ccd425ed291d721746df4003189fa91a22c804"
  license "MIT"

  depends_on macos: :big_sur

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
