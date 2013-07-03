require 'spec_helper'

describe "galleries/new" do
  before(:each) do
    assign(:gallery, stub_model(Gallery,
      :name => "MyString",
      :category_id => 1,
      :slug => "MyString"
    ).as_new_record)
  end

  it "renders new gallery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", galleries_path, "post" do
      assert_select "input#gallery_name[name=?]", "gallery[name]"
      assert_select "input#gallery_category_id[name=?]", "gallery[category_id]"
      assert_select "input#gallery_slug[name=?]", "gallery[slug]"
    end
  end
end
