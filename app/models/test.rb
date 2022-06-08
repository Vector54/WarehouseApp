class Test < ApplicationRecord
  enum test_attr: [:pending, :processing, :done]
end
