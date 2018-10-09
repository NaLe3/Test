class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def import
    User.my_import(params[:file])
    redirect_to root_url, notice: "Votre fichier a bien été importé"
  end

  def show
    @users = CsvFile.last.users
    @reservation = @users.pluck(:reservation)
    @email = @users.pluck(:email)
    @age = @users.pluck(:age)
    @average_prices = []
    @prices_per_show = []
    @show_title = @users.pluck(:representation)
    @price= @users.select(:prix)
  end

  def trim(num)
    i = num.to_i
    f = num.to_f
    i == f ? i : f
  end

end
