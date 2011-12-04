require 'spec_helper'

describe "credentials/edit.html.haml" do
  before(:each) do
    @credential = assign(:credential, stub_model(Credential))
  end

  it "renders the edit credential form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => credentials_path(@credential), :method => "post" do
    end
  end
end
