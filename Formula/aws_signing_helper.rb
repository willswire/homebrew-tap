class AwsSigningHelper < Formula
  desc "rolesanywhere-credential-helper implements the signing process for IAM Roles Anywhere"
  homepage "https://github.com/aws/rolesanywhere-credential-helper"
  url "https://github.com/aws/rolesanywhere-credential-helper/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "71e65229ce523e019dae411a18094ecaa642e801e8520b8548c18561576f994b"
  license "Apache-2.0"

  depends_on "go" => :build
  
  def install
    # Build the binary using Go; adjust ldflags as needed.
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    # Run the binary with a version flag to check it works.
    output = shell_output("#{bin}/rolesanywhere-credential-helper --version")
    assert_match "rolesanywhere-credential-helper", output
  end
end
