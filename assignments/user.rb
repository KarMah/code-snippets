require 'json'
class User
  attr_reader :username, :phone_number, :errors

  def initialize(username, phone_number)
    @username = username
    @phone_number = phone_number
    @errors = []
  end

  def to_json
    validate!
    unless errors.empty?
      { 'error_message': build_error_message }
    else
      { user: { username: username,
                phone_number: phone_number }
      }.to_json
    end
  end

  private

  def build_error_message
    errors.join('. ')
  end

  def validate!
    validate_phone_number
    validate_phone_number_username_equality
    validate_username_length
  end

  def validate_phone_number
    unless phone_number.match(/^1[0-9]{10}$/)
      errors.push('phone_number must be an 11 digit phone number that starts with 1')
    end
  end

  def validate_phone_number_username_equality
    if phone_number == username
      errors.push("phone_number can't be equal to the username")
    end
  end

  def validate_username_length
    if username.length.between?(3,32)
      'username must be between 3-32 alphanumeric characters'
    end
  end
end

user = User.new('mahesh', '16095829575')
user.to_json
