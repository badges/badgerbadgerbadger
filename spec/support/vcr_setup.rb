require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.default_cassette_options                = { :record => :once }
  c.allow_http_connections_when_no_cassette = false
  c.debug_logger = File.open('/tmp/wtf.log', 'w')

  [
      'PUBLIC_KEY',
      'PRIVATE_KEY'
  ].each do |env_var|
    c.filter_sensitive_data("<#{env_var}>") { ENV[env_var] }
  end

  c.configure_rspec_metadata!
end
