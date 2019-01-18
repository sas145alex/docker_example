require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :fn => "Fn",
        :ln => "Ln",
        :email => "Email"
      ),
      Person.create!(
        :fn => "Fn",
        :ln => "Ln",
        :email => "Email"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Fn".to_s, :count => 2
    assert_select "tr>td", :text => "Ln".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
