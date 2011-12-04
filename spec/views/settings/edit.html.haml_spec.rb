require 'spec_helper'

describe "settings/edit.html.haml" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting))
  end

  it "renders the edit setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path(@setting), :method => "post" do
    end
  end
end
