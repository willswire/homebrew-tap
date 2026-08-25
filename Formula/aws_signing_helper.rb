class AwsSigningHelper < Formula
  desc "rolesanywhere-credential-helper implements the signing process for IAM Roles Anywhere"
  homepage "https://github.com/aws/rolesanywhere-credential-helper"
  url "https://github.com/aws/rolesanywhere-credential-helper/archive/refs/tags/v1.8.5.tar.gz"
  sha256 "34a6f7daa860cb24d6c38b0cc25c228071b2ff0e2526348f193c18c3ceb6d948"
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
