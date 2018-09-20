class Guest < ApplicationRecord
    validates :address, :phone_number, :email, :firstname, :lastname, :first_furigana, :last_furigana, :first_zip_code, :last_zip_code, :prefectures, :municipalities, {presence: true}
end


