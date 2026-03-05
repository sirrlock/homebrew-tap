class Sirrd < Formula
  desc "Sirr daemon — self-hosted ephemeral secret vault server"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.35"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-arm64.tar.gz"
      sha256 "db44b6c1e461f3c6e7dab0d9f9dd2e0e5e8a53854128f409d7688f84fc8601d2"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-x64.tar.gz"
      sha256 "ae790d6048ac8cd2320e861b26e73d56405dc850a865a18cac529c3d61307677"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-arm64.tar.gz"
      sha256 "41d4a7530b0461569b49a2e9d0c3f7f06dce7ed9388301ff9b6eb055f2cc6f90"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-x64.tar.gz"
      sha256 "4ba4e69fab278d0744f38115fc69e8c01283f5ec891a95713de1f5092d2106ab"
    end
  end

  def install
    bin.install "sirrd"
  end

  service do
    run [opt_bin/"sirrd", "serve"]
    keep_alive true
    log_path var/"log/sirrd.log"
    error_log_path var/"log/sirrd.log"
    environment_variables SIRR_DATA_DIR: var/"sirrd"
  end

  def post_install
    (var/"sirrd").mkpath
  end

  def caveats
    <<~EOS
      Thanks for installing sirrd!

      Set your master key and start the server:
        export SIRR_MASTER_KEY="$(openssl rand -hex 32)"
        sirrd serve

      Or run as a background service:
        brew services start sirrlock/tap/sirrd

      Quickstart and docs: https://sirr.dev/en/quickstart
    EOS
  end

  test do
    assert_match(/sirr/, shell_output("#{bin}/sirrd --version"))
  end
end
