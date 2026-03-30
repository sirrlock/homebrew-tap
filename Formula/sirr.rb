class Sirr < Formula
  desc "CLI client for Sirr — push, get, and manage ephemeral secrets"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-arm64.tar.gz"
      sha256 "4cb7db97dbe0bb437d32415d0b250e5f65d0c7c2006ab72049c848accfe1e621"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-darwin-x64.tar.gz"
      sha256 "5d66601eb1b5b6f28af76a55d6a337eef9acdbd7c46ce162746a72ad1d61000c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-arm64.tar.gz"
      sha256 "c44dc96af948f399c92e54f2c25370b4aacb693f19cffd7a137c9d760bef783a"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirr-linux-x64.tar.gz"
      sha256 "1c5d5a488a9aabd8cb0bc4d0a93f6322c4b4ea65830190f290163968996fe796"
    end
  end

  def install
    bin.install "sirr"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sirr --version")
  end
end
