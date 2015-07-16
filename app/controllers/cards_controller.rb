class CardsController < ApplicationController
def index
  if params[:user_id].present?
    @user = User.find params[:user_id]
    @cards = @user.cards
  else
    @cards = Card.all
  end
end

def new
  @card = Card.new
end

def create
    @card = Card.new(card_params)
    @card.users << current_user

    if @card.valid?
      @card.save!
      redirect_to cards_path
    else
      flash[:alert] = "An error occurred"
      render :new
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  private
    def card_params
      params.require(:card).permit(:number,
                                   :exp_month,
                                   :exp_year)
    end
  end     
end
