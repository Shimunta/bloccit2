require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:question)  { Queston.create!(title: "Question Title", body: "Question Body", resolved: false) }
  let(:answer) { Answer.create!(body: "Answer here") }

  describe "attributes" do
    it "gives answer body attribute" do
      expect(answer).to have_attributes(body: "Answer here")
    end
  end
end
