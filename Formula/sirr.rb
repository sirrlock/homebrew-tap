class Sirr < Formula
  desc "CLI client for Sirr — push, get, and manage ephemeral secrets"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "efceb5f9e80b61ebab29bd29400c5b764e7f0667b3ab1948377b654eaeca4220"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "736d0c513bed3d10ee6aa845c240fb14456f5803586929c11ae599c895b80253"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "e690cc5865601e88d1535a05840946bcde9a789391abd30988698859fd0aae5f"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "ab439a24d1fab2d817079ee47e6e2a941f498e00767fd90f1b4b67c02c8eefe7"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
