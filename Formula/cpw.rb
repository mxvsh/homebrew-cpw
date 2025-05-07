class Cpw < Formula
  desc "File watcher that copies changed files to a destination"
  homepage "https://github.com/mxvsh/cpw"
  version "0.1.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mxvsh/cpw/releases/download/v0.1.6/cpw-darwin-arm64"
      sha256 "0464fe12db6f1b318e07a871ad29200d572877d85daaa707154ef10d59b95e42"
    end
  end
  
  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/mxvsh/cpw/releases/download/v0.1.6/cpw-linux-arm64"
      sha256 "1f7c241379826a5539981539eafc1431b2210b68a9db0bdc749aa8b69124c93d"
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/mxvsh/cpw/releases/download/v0.1.6/cpw-linux-armv7"
      sha256 "e990baf29499789a917d3c1bdd0e6e65e02d1c2c90064209addd5c254ffdc846"
    end
  end

  def install
    bin.install Dir["cpw-*"].first => "cpw"
  end

  test do
    system "#{bin}/cpw", "-version"
  end
end 