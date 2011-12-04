require 'spec_helper'

describe SessionsController do


  describe "GET 'destroy'" do
    it "redirects to home page" do
      get 'destroy'
      response.should be_redirect
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
