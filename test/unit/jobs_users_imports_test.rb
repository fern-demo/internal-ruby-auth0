# frozen_string_literal: true

require_relative "../test_helper"
require "minitest/autorun"
require "webmock/minitest"
require "tempfile"

# Regression test for https://github.com/auth0/ruby-auth0/issues/796
class JobsUsersImportsTest < Minitest::Test
  BASE_URL = "https://example.auth0.test/api/v2"

  def setup
    @client = Auth0::Management.new(token: "<token>", base_url: BASE_URL)
  end

  def test_create_uploads_the_users_file_as_multipart_part
    captured = nil
    stub_request(:post, "#{BASE_URL}/jobs/users-imports")
      .with { |req| captured = req }
      .to_return(status: 200, body: { id: "job_1", status: "pending" }.to_json,
                 headers: { "Content-Type" => "application/json" })

    Tempfile.create(["users", ".json"]) do |file|
      file.write("[{\"email\":\"user@example.com\"}]")
      file.flush

      response = @client.jobs.users_imports.create(users: file.path, connection_id: "con_123", upsert: true)

      assert_equal "job_1", response.id
    end

    refute_nil captured
    assert_match(%r{multipart/form-data; boundary=}, captured.headers["Content-Type"])
    assert_includes captured.body, "name=\"users\"; filename=\"users"
    assert_includes captured.body, "[{\"email\":\"user@example.com\"}]"
    assert_includes captured.body, "name=\"connection_id\"\r\n\r\ncon_123"
    assert_includes captured.body, "name=\"upsert\"\r\n\r\ntrue"
  end
end
