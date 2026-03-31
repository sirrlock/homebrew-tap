class Sirrd < Formula
  desc "Sirr daemon — self-hosted ephemeral secret vault server"
  homepage "https://github.com/sirrlock/sirr"
  version "1.0.40"
  license "BSL-1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-arm64.tar.gz"
      sha256 "cbb4d9be921356deec70af7a1abb75b4d6632b0ed7495a4db3856ee28caef9e8"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-darwin-x64.tar.gz"
      sha256 "0dc55085b4cca767ba453854c9e4ddcfd749cfea0465fc82bb111d0c4b717ca2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-arm64.tar.gz"
      sha256 "cdb3e1db42eed95f538666dbf125dfc98000a642fca79e91210713c61433932a"
    else
      url "https://github.com/sirrlock/sirr/releases/download/v#{version}/sirrd-linux-x64.tar.gz"
      sha256 "9dc5eaee5f5bfb5a1d806cd99de647df3cf6345a5a0627e342396aad3f149a2f"
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
