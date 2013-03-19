require 'spec_helper'

describe SpreadsheetsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'import'" do
    it "returns http success" do
      get 'import'
      response.should be_success
    end
  end

end
