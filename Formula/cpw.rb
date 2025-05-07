class Cpw < Formula
  desc "File watcher that copies changed files to a destination"
  homepage "https://github.com/mxvsh/cpw"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mxvsh/cpw/releases/download/v0.1.8/cpw-darwin-arm64"
      sha256 "758dde6e359bf122f881699ff6307aa3e04dee9a2f5600e1be568f0ee57bdd4e"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mxvsh/cpw/releases/download/v0.1.8/cpw-linux-arm64"
      sha256 "c9f0b1eac1ac2e3bf027afe72da5335011dab3af343d639486ac2357be3f665b"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/mxvsh/cpw/releases/download/v0.1.8/cpw-linux-armv7"
      sha256 "08c326d39da0f99f63ceed3bebf1b69efa1f22ed6ae9f29366972c4f33d885bc"
    end
  end

  def install
    bin.install Dir["cpw-*"].first => "cpw"
  end

  test do
    system "#{bin}/cpw", "-version"
  end
end 