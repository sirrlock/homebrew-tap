class Sirr < Formula
  desc "CLI client for Sirr — push (dead drop), set (org secrets), get, and audit"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "4774746a6e44e16ac79e21a393a2b98997d84526dacced80d6434c3fbd98f3fe"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "1332ba75500ae4c66fe995c047114307f2ce3803150da4be7ba0a3a6ff271adc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "515f18857ea094278215b143762f89f30501bfa2ec6c770cfc31ae3e882480a3"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "43dedeb3fbdb703a3934adef7499fcb07dc0161c708c1fb33906e949fcc9cc1d"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
