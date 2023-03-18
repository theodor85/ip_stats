# frozen_string_literal: true

module IpStats
  class Statistics
    def call(_ip_address, _start_time, _end_time)
      { stats: '123' }.to_json
    end
  end
end
