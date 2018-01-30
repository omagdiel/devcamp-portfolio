class PortfoliosController < ApplicationController
  layout 'portfolio'
  def index
    @portfolio_items = Portfolio.all
  end

  # def angular
  #   @angular_portfolio_items = Portfolio.angular
  # end

  def new
    @portfolio_items = Portfolio.new
    3.times {@portfolio_items.technologies.build}
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio was successfully created.' }
        # format.json { render :show, status: :created, location: @portfolio_items }
      else
        format.html { render :new }
        # format.json { render json: @portfolio_items.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @portfolio_items = Portfolio.find(params[:id])
  end

  def update
    @portfolio_items = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end
  def show
    @portfolio_items = Portfolio.find(params[:id])
  end

  def destroy
    #perform the lookup================
    @portfolio_items = Portfolio.find(params[:id])
# => Destroy/delete the record==============
    @portfolio_items.destroy
    #redirect==================
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
    end
  end
end

private

  def portfolio_params

    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )

  end
