# frozen_string_literal: true

class Shore < Formula
  desc "Terminal chat client for the shore AI character engine"
  homepage "https://github.com/mythofmeat/shore"
  url "https://github.com/mythofmeat/shore.git",
      tag:      "v4.55.0",
      revision: "4aac211f00b78ec67576f6dde54f863eb69d224a"
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
