require 'rails_helper'

module PostCreateContractHelpers

  def post_params(user_id: user.id, title: "Some Title", body: "Some Body")
    {
      user_id: user_id,
      title: title,
      body: body
    }
  end

end
