require 'spec_helper'

describe "galleries/show" do
  before(:each) do
    @gallery = assign(:gallery, stub_model(Gallery,
      :name => "Name",
      :category_id => 1,
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/Slug/)
  end
end
