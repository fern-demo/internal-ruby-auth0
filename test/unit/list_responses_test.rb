# frozen_string_literal: true

require_relative "../test_helper"
require "minitest/autorun"
require "webmock"

# Regression test for https://github.com/auth0/ruby-auth0/issues/795
class ListResponsesTest < Minitest::Test
  BASE_URL = "https://example.auth0.test/api/v2"

  include WebMock::API

  def setup
    WebMock.enable!
    WebMock.disable_net_connect!
    @client = Auth0::Management.new(token: "<token>", base_url: BASE_URL)
  end

  def teardown
    WebMock.reset!
    WebMock.allow_net_connect!
    WebMock.disable!
  end

  def stub_json(method, path, body)
    stub_request(method, "#{BASE_URL}/#{path}")
      .to_return(status: 200, body: body, headers: { "Content-Type" => "application/json" })
  end

  def test_list_users_by_email_returns_typed_array
    stub_json(:get, "users-by-email?email=jane@example.com",
              [{ user_id: "auth0|1", email: "jane@example.com", blocked: false }].to_json)

    users = @client.users.list_users_by_email(email: "jane@example.com")

    assert_kind_of Array, users
    assert_equal 1, users.size
    assert_kind_of Auth0::Types::UserResponseSchema, users.first
    assert_equal "auth0|1", users.first.user_id
    refute users.first.blocked
  end

  def test_log_streams_list_returns_typed_array
    stub_json(:get, "log-streams", [{ id: "lst_1", name: "stream", type: "http", status: "active" }].to_json)

    streams = @client.log_streams.list

    assert_equal 1, streams.size
    assert_kind_of Auth0::Types::LogStreamHTTPResponseSchema, streams.first
    assert_equal "lst_1", streams.first.id
  end

  def test_stats_get_daily_returns_typed_array
    stub_json(:get, "stats/daily", [{ date: "2026-01-01", logins: 5, signups: 2 }].to_json)

    stats = @client.stats.get_daily

    assert_kind_of Auth0::Types::DailyStats, stats.first
    assert_equal 5, stats.first.logins
  end

  def test_empty_array_body_returns_empty_array
    stub_json(:get, "rules-configs", "[]")

    assert_empty @client.rules_configs.list
  end

  def test_empty_success_body_returns_nil
    stub_request(:get, "#{BASE_URL}/jobs/job_1/errors").to_return(status: 204, body: "")

    assert_nil @client.jobs.errors.get(id: "job_1")
  end

  def test_nullable_named_response_is_deserialized
    stub_json(:get, "jobs/job_1/errors",
              [{ user: { email: "a@example.com" }, errors: [{ code: "x", message: "bad" }] }].to_json)

    errors = @client.jobs.errors.get(id: "job_1")

    assert_kind_of Array, errors
    assert_equal 1, errors.size
    assert_kind_of Auth0::Types::GetJobErrorResponseContent, errors.first
    assert_equal "a@example.com", errors.first.user["email"]
    assert_equal "x", errors.first.errors.first.code
  end

  def test_nullable_named_response_resolves_other_union_member
    stub_json(:get, "jobs/job_1/errors",
              { status: "failed", type: "users_import", id: "job_1",
                errors: [{ code: "x", message: "bad" }] }.to_json)

    errors = @client.jobs.errors.get(id: "job_1")

    assert_kind_of Auth0::Types::GetJobGenericErrorResponseContent, errors
    assert_equal "failed", errors.status
  end

  def test_nullable_named_model_response_is_deserialized
    stub_json(:get, "guardian/factors/sms/templates", { enrollment_message: "hi", verification_message: "vv" }.to_json)

    templates = @client.guardian.factors.sms.get_templates

    assert_kind_of Auth0::Types::GetGuardianFactorSmsTemplatesResponseContent, templates
    assert_equal "hi", templates.enrollment_message
  end
end
