module Posts
  class PostCreateContract < Dry::Validation::Contract
    params do
      required(:user_id).filled
      required(:title).filled(:string, format?: /^[a-zA-Z0-9 ,.'-]+$/)
      required(:body).filled(:string, format?: /^[a-zA-Z0-9 ,.'-]+$/)
    end

    rule(:user_id) do
      unless User.exists?(id: value)
        key.failure('User does not exist')
      end
    end
  end
end
