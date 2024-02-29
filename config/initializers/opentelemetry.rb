require 'opentelemetry/sdk'
require 'opentelemetry/exporter/honeycomb'

OpenTelemetry::SDK.configure do |c|
  c.service_name = ''
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      OpenTelemetry::Exporter::Honeycomb::Exporter.new(
        writekey: '',
        dataset: ''
      )
    )
  )
end
