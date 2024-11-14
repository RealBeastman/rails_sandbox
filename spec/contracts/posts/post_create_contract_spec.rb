require 'rails_helper'
require './spec/support/post_create_contract_helpers'

RSpec.configure do |c|
  c.include PostCreateContractHelpers
end

RSpec.describe Posts::PostCreateContract do
  let(:contract) { described_class.new}
  let (:user) { create(:user) }

  describe ('Parameter Validations -') do
    context 'when params are valid' do
      # set slug as a valid param
      let(:valid_params) { post_params() }

      it 'the validation passes' do
        result = contract.call(valid_params)
        expect(result.success?).to be(true)
        expect(result.errors).to be_empty
      end
    end
  end

  # User_id validation
  describe ('User Validation -') do
    context 'when user does not exist' do
      # set user id outside of created users range
      let(:invalid_params) { post_params(user_id: 5) }

      it 'the validation fails' do
        result = contract.call(invalid_params)
        expect(result.success?).to be(false)
        expect(result.errors[:user_id]).to include("User does not exist")
      end
    end
  end

  # Title validation
  describe ('Title Validation -') do
    context 'when title is invalid' do
      # set invalid characters in title variable
      let(:invalid_params) { post_params(title: "##@[]")}

      it 'the validation fails' do
        result = contract.call(invalid_params)
        expect(result.success?).to be(false)
        expect(result.errors[:title]).to include("is in invalid format")
      end
    end
  end
end
