class EcsVoyager < Formula
  desc "Terminal user interface (TUI) for exploring and managing AWS ECS resources"
  homepage "https://github.com/benbpyle/ecs-voyager"
  version "0.2.0"
  license "MIT"

  # This formula uses prebuilt binaries and does not require compilation
  def self.needs_compiler?
    false
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/benbpyle/ecs-voyager/releases/download/v0.2.0/ecs-voyager-v0.2.0-aarch64-apple-darwin.tar.gz"
    sha256 "7a7e27bbe3033dcb7a71ceab96cad900e0b5f315409180399926b0d1598769cb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/benbpyle/ecs-voyager/releases/download/v0.2.0/ecs-voyager-v0.2.0-x86_64-apple-darwin.tar.gz"
    sha256 "1d7fcee446196c405e80780d781b0555dc8fdbf1f441300ddf59f8aeb2bb9e27"
  end

  def install
    bin.install "ecs-voyager"
  end

  test do
    assert_match "ecs-voyager", shell_output("#{bin}/ecs-voyager --version 2>&1", 0)
  end
end
