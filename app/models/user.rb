class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_commit :async_update, on: [:create, :update]

  private

  def async_update
    FakeJob.set(wait: 1.minute).perform_later(self.id)
  end
end
