class EcsVoyager < Formula
  desc "Terminal user interface (TUI) for exploring and managing AWS ECS resources"
  homepage "https://github.com/benbpyle/ecs-voyager"
  version "0.2.7"
  license "MIT"

  # This formula uses prebuilt binaries and does not require compilation
  def self.needs_compiler?
    false
  end

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/benbpyle/ecs-voyager/releases/download/v0.2.7/ecs-voyager-v0.2.7-aarch64-apple-darwin.tar.gz"
    sha256 "1924ebeac8870532dd8851a034b7ea6c639f664c3ef05bc50b78f22639130985"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/benbpyle/ecs-voyager/releases/download/v0.2.7/ecs-voyager-v0.2.7-x86_64-apple-darwin.tar.gz"
    sha256 "e43974d6e91aee3cd67b2cfe023f2c4ff0b04586a876e8c612db5d503b7ae2b3"
  end

  def install
    bin.install "ecs-voyager"
  end

  test do
    assert_match "ecs-voyager", shell_output("#{bin}/ecs-voyager --version 2>&1", 0)
  end
end
