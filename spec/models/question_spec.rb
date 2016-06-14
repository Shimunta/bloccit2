require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "A question?", body: "An explanation?", resolved: false) }

  describe "attributes" do
    it "checks to make sure attributes are there" do
      expect(question).to have_attributes(title: "A question?", body: "An explanation?", resolved: false)
    end
  end
end
