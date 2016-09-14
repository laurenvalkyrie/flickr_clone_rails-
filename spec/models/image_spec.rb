require 'rails_helper'

describe Image do
  it { should validate_presence_of :caption}
  it { should validate_presence_of :user_id}

  it { should belong_to :user}
end
