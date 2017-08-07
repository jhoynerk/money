module Configuration

  class Configuration
    attr_accessor :default_currency, :conversions
  end

  def configuration
    @configuration ||= Configuration.new
  end

  def configure
    yield configuration
  end
end
