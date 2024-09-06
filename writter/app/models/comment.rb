class ValidAuthorValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless User.exists?(email: value)
        record.errors.add(attribute, "must be an email of an existing user")
      end
    end
  end

class Comment < ApplicationRecord
    validates :author, valid_author: true
    belongs_to :post
end
