class User < ApplicationRecord
  validates :first_name, :last_name, presence: true # 不能為空
  validates :gender, inclusion: { in: %w(male female others), # 必須是這三個值
                                message: 'Please fill one of options in. EX: male female others' }
  validates :age, numericality: { only_integer: true, # 只能為整數且必須大於 0
                                  greater_than_or_equal_to: 0}
end
