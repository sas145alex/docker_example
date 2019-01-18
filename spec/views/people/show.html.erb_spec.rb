require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      :fn => "Fn",
      :ln => "Ln",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fn/)
    expect(rendered).to match(/Ln/)
    expect(rendered).to match(/Email/)
  end
end
