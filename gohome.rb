# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Gohome < Formula
  desc "go/links daemon for your local machine"
  homepage "https://github.com/EBNull/gohome"
  version "0.0.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/EBNull/gohome/releases/download/v0.0.12/gohome_Darwin_x86_64.tar.gz"
      sha256 "c16cc0e0f0e7e28892a733a603086765b3f0d9f5ce923423ba3d50daa13a26dd"

      def install
        bin.install "gohome"
      end
    end
    on_arm do
      url "https://github.com/EBNull/gohome/releases/download/v0.0.12/gohome_Darwin_arm64.tar.gz"
      sha256 "11a515a42628a5d84f82e3a4f0a49755b34f0ac031abfb3ac7e3f7af1406eb07"

      def install
        bin.install "gohome"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/EBNull/gohome/releases/download/v0.0.12/gohome_Linux_x86_64.tar.gz"
        sha256 "712c062e187a7beddc1f9b03e38855565f4014c6237477957d8972db04729166"

        def install
          bin.install "gohome"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/EBNull/gohome/releases/download/v0.0.12/gohome_Linux_arm64.tar.gz"
        sha256 "825d31532c5f819efcee3f843597aa7e78bf0cdce8b350826c0da2ca5dd8cff4"

        def install
          bin.install "gohome"
        end
      end
    end
  end

  def caveats
    <<~EOS
      To write a default configuration file for the service, run:
      gohome --config /opt/homebrew/etc/gohome.flags --write-config
    EOS
  end

  service do
    run [opt_bin/"gohome", "--config", HOMEBREW_PREFIX/"etc/gohome.flags", "--cache", HOMEBREW_PREFIX/"var/cache/golink_cache.json"]
    require_root true
    keep_alive true
    working_dir HOMEBREW_PREFIX
    log_path HOMEBREW_PREFIX/"var/gohome-stdout.txt"
    error_log_path HOMEBREW_PREFIX/"var/gohome-stderr.txt"
  end

  test do
    system "#{bin}/gohome --version"
  end
end
