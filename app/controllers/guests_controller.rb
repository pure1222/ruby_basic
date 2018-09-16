class GuestsController < ApplicationController
  def form
  end
  def info
    @guest = Guest.new(
      firstname: params[:first],lastname: params[:last],first_furigana: params[:first_furigana],last_furigana: params[:last_furigana],
      first_zip_code: params[:zip_code1],last_zip_code: params[:zip_code2],prefectures: params[:prefectures],municipalities: params[:municipalities],
      address: params[:address],phone_number: params[:phone],email: params[:email]
    )
    @guest.save
    redirect_to("#")
  end
end
