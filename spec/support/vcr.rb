require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock

  replacement_twilreapi_account_sid = "ACC123456789"
  replacement_twilreapi_host = "example.com"
  twilreapi_account_sid_regexp = /Accounts\/(.+?)\//

  c.filter_sensitive_data("<ENCODED AUTH HEADER>") do |interaction|
    interaction.request.headers["Authorization"].first
  end

  c.filter_sensitive_data(replacement_twilreapi_account_sid) do |interaction|
    (twilreapi_account_sid_regexp.match(interaction.request.uri.to_s) || [])[1]
  end

  c.filter_sensitive_data(replacement_twilreapi_host) do |interaction|
    URI.parse(interaction.request.uri).host
  end

  c.register_request_matcher(:twilreapi_api_resource) do |actual, playback|
    actual_host = URI.parse(actual.uri).host
    actual_account_sid = (twilreapi_account_sid_regexp.match(actual.uri.to_s) || [])[1]
    replaced_url = actual.uri.to_s.sub(actual_host, replacement_twilreapi_host).sub(actual_account_sid.to_s, replacement_twilreapi_account_sid)
    replaced_url == playback.uri.to_s
  end
end

RSpec.configure do |config|
  config.around(:vcr => true) do |example|
    cassette = example.metadata[:cassette] || raise(ArgumentError, "You must specify a cassette")
    vcr_options = example.metadata[:vcr_options] || {}
    VCR.use_cassette(cassette, vcr_options) { example.run }
  end
end