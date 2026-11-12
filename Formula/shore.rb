# frozen_string_literal: true

class Shore < Formula
  desc "Terminal chat client for the shore AI character engine"
  homepage "https://github.com/mythofmeat/shore"
  url "https://github.com/mythofmeat/shore.git",
      tag:      "v4.59.0",
      revision: "aa5f6d92f82eb61ce69b8b9594fabf1309780b9b"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    cd "client" do
      system "cargo", "install", "--root", prefix, "--path", "shore-cli"
    end

    generate_completions_from_executable(bin/"shore", "completions")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shore --version")
  end
end
