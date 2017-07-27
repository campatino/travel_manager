class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    Roles = {admin: 1, client: 0}
    Status = {active: 1, inactive: 0}
end
