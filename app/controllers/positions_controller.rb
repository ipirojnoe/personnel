class PositionsController < ApplicationController
  def new
    @position = Position.new
    @position_history = @position.position_histories.build
  end

  def create
    position = Position.create()

    position_history = position.position_histories.build(position_history_params)

    if position_history.save
      redirect_to root_path, success: 'Должность создана'
    else
      flash.now[:danger] = 'Указаны недопустимые данные'
      render 'edit'
    end
  end

  def edit
    @position = Position.find(params[:id])
    @position_history = @position.position_histories.current
  end

  def update
    position = Position.find(params[:id])

    position_history = position.position_histories.build(position_history_params)

    if position_history.save
      redirect_to root_path, success: 'Должность обновлена'
    else
      flash.now[:danger] = 'Указаны недопустимые данные'
      render 'edit'
    end
  end

  def position_history_params
    params.require(:position_history).permit(:name)
  end
end
