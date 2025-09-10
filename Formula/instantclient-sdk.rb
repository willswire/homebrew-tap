# Formula for Oracle Instant Client SDK
class InstantclientSdk < Formula
  desc "Oracle Instant Client SDK"
  homepage "https://www.oracle.com/database/technologies/instant-client/downloads/index.html"
  
  if Hardware::CPU.arm?
    url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-sdk-macos.arm64-23.3.0.23.09.dmg"
    sha256 "3deadfce089eb6b9c091b1fd213ed7a66685bb22643c7c74be5e050ad8cfccbb"
  else
    url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-sdk-macos.x64-19.8.0.0.0dbru.zip"
    sha256 "0fa8ae4c4418aa66ce875cf92e728dd7a81aeaf2e68e7926e102b5e52fc8ba4c"
  end
  
  
  def install
    lib.install ["sdk"]
    # Header files can not be moved out of sdk/include because some software
    # (e.g. ruby-oci8) expects to find them there. Link the header files instead.
    Dir[lib.join("sdk/include/*.h")].each do |header_file|
      include.install_symlink header_file
    end
  end
  
  test do
    (testpath/"test.c").write <<~EOS
      #include <oci.h>
      
      int main()
      {
        ub4 od = OCI_DEFAULT;
        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-I#{include}", "-o", "test"
    system "./test"
  end
end
