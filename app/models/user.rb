# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps

  GENDER = %w[male female others].freeze
  ADDRESS = %w[county address_1 address_2].freeze

  field :first_name, type: String
  field :last_name, type: String
  field :gender, type: String
  field :age, type: Integer
  field :address, type: Hash

  validates :first_name, :last_name, presence: true
  validates :gender, inclusion: { in: GENDER,
                                  message: "Please fill one of options in. EX: #{GENDER}.join(' ')" }
  validates :age, numericality: { only_integer: true,
                                  greater_than_or_equal_to: 0 }

  validate :only_county_address_1_and_address_2

  def only_county_address_1_and_address_2
    unpermit_keys = address.keys - ADDRESS

    errors.add :address, :invalid, message: "#{unpermit_keys.join(' ')} is not allowed" if unpermit_keys != []
  end

  def full_name
    # first_name + " " + last_name
    # "#{first_name} #{last_name}"
    [first_name, last_name].join(' ')
  end
end
