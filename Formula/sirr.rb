class Sirr < Formula
  desc "CLI client for Sirr — push, get, and manage ephemeral secrets"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "c491fcc5759f486222378f050305bcf119d4b48dc87091cd47f36e259cee9bf6"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "ecdcf307647905b71afa3b26fab3d20177abe07981d61677b403ef9668d96e53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "d58258cb09ea29214cc14049a510fbf290b04d1702bc4321aa909248878d1274"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "c95a906984a16f69e988557076c63770beb1c464fc6f097ad5bf12db960869a7"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
