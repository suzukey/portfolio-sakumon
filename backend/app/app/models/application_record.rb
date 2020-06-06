class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  BASE64_SIZE = 8

  private

  def randomize_id(size = BASE64_SIZE)
    loop do
      self.id = SecureRandom.urlsafe_base64(size)

      # 同じidのレコードが存在しなければ場合はループをぬける
      break if self.class.find_by(id: id).blank?
    end
  end
end
