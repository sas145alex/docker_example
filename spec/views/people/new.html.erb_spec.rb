require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      :fn => "MyString",
      :ln => "MyString",
      :email => "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[fn]"

      assert_select "input[name=?]", "person[ln]"

      assert_select "input[name=?]", "person[email]"
    end
  end
end
