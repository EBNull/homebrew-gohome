# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Gohome < Formula
  desc "go/links daemon for your local machine"
  homepage "https://github.com/EBNull/gohome"
  version "0.0.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/EBNull/gohome/releases/download/v0.0.9/gohome_Darwin_x86_64.tar.gz"
      sha256 "65f7ae8f8a522c7b4e17abb7b62bf81b6310203049a2b7ae6c422bdd24841ebd"

      def install
        bin.install "gohome"
      end
    end
    on_arm do
      url "https://github.com/EBNull/gohome/releases/download/v0.0.9/gohome_Darwin_arm64.tar.gz"
      sha256 "3ad89d8c95925b1ffa529cbbcb8767e9b1dc11b8cfc898d802306b623e52bfcf"

      def install
        bin.install "gohome"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/EBNull/gohome/releases/download/v0.0.9/gohome_Linux_x86_64.tar.gz"
        sha256 "264f1a57544f3dac827162b9889bb294c5aea0a375e222adc30a1a0ed7364a94"

        def install
          bin.install "gohome"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/EBNull/gohome/releases/download/v0.0.9/gohome_Linux_arm64.tar.gz"
        sha256 "de0dd1e5dcdc4d41a0e29c2d8dc8826e2dcc9ecadc87574fbf02675c2f9b4366"

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
