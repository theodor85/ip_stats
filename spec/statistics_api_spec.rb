require "spec_helper"

RSpec.describe IpStats::App do
  def app
    IpStats::App
  end

  describe "GET statistics" do      
    context "one hour" do      
      it "returns statistics" do
        get "/statistics?ip_address=127.0.0.1&start_time=2023-03-20T12:00&end_time=2023-03-20T13:00"

        expect(last_response.body).to eq({
          ip_address: '127.0.0.1',
          average_rtt: 100,
          max_rtt: 250,
          med_rtt: 120,
          standard_deviation_rtt: 10,
          lost_persentage: 3
        })
        expect(last_response.status).to eq 200
      end
    end
  end
end
