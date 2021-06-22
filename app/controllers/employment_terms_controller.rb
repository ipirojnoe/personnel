class EmploymentTermsController < ApplicationController
  def new
    @employment_term = EmploymentTerm.new

    users = User.all

    unless users.present?
      redirect_to root_path, danger: 'Необходимо добавить сотрудника'
      return
    end

    divisions = Division.all

    unless divisions.present?
      redirect_to root_path, danger: 'Необходимо добавить подразделение'
      return
    end

    positions = Position.all

    redirect_to root_path, danger: 'Необходимо добавить должность' unless positions.present?

    @options_for_users = users.map { |user| [user.full_name, user.id] }

    @options_for_divisions = divisions.map { |division| [division.name, division.id] }

    @options_for_positions = positions.filter_map do |position|
      position_history = position.position_histories

      [position_history.current.name, position.id] if position_history.present?
    end
  end

  def create
    begin
      user = User.find(employment_term_params[:user])

      position = Position.find(employment_term_params[:position])

      division = Division.find(employment_term_params[:division])
    rescue ActiveRecord::RecordNotFound
      redirect_to new_employment_terms_path, danger: 'Указаны недопустимые данные'

      return
    end

    employment_term = EmploymentTerm.new(user: user, position: position, division: division,
       begin_date: employment_term_params[:begin_date], end_date: employment_term_params[:end_date])

    if employment_term.save!
      redirect_to users_path, success: 'Условие труда создано'
    else
      flash.now[:danger] = 'Указаны недопустимые данные'
      render 'new'
    end
  end

  private

  def employment_term_params
    params.require(:employment_term).permit(:user, :division, :position, :begin_date, :end_date)
  end
end
