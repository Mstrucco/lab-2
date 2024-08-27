class ValidAuthorValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless User.exists?(email: value)
        record.errors.add(attribute, "must be an email of an existing user")
      end
    end
  end
  

class Post < ApplicationRecord
    validates :content, length: { minimum: 140 }
    validates :title, length: { maximum: 100 }
    enum published: { unpublished: 0, published: 1 }
    validates :author, valid_author: true


end
