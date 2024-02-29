require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/all'

OpenTelemetry::SDK.configure do |c|
  c.service_name = ''
  c.use_all 'OpenTelemetry::Instrumentation::All'
  c.add_exporter(OpenTelemetry::Exporter::OTLP::Exporter.new(endpoint: ''))
end
