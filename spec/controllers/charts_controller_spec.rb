require 'spec_helper'

describe ChartsController do

  describe "GET 'heat_map'" do
    it "returns http success" do
      get 'heat_map'
      response.should be_success
    end
  end

end
