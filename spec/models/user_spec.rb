require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password') }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'has many reservations' do
    expect(User.reflect_on_association(:reservations).macro).to eq(:has_many)
  end

  it 'has many places through reservations' do
    expect(User.reflect_on_association(:places).macro).to eq(:has_many)
  end

  it 'has many places' do
    expect(User.reflect_on_association(:places).macro).to eq(:has_many)
  end
end
