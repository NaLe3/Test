class CsvFilesController < ApplicationController
  def index
    @users = User.all
  end

  def import
    CsvFile.my_import(params[:file])
    redirect_to root_url, notice: "Votre fichier a bien été importé"
  end

  def show
    @users = CsvFile.last.users
    @reservations = Reservation.all
    @age = @users.pluck(:age)
    @average_prices = []
    @prices_per_show = []
    @representations = Representation.all
    @show_title = @representations.pluck(:representation)
    @price = Representation.pluck(:prix)
  end

  def trim(num)
    i = num.to_i
    f = num.to_f
    i == f ? i : f
  end
  helper_method :trim

end
