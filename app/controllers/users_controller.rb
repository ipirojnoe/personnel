class UsersController < ApplicationController
  before_action :set_user, except: %i[index new create]
  def index
    @users = User.all
  end

  def show
    @employment_term = EmploymentTerm.new

    if params[:employment_term].present?
      begin_date = params[:employment_term][:begin_date]
      end_date = params[:employment_term][:end_date]

      employment_terms = EmploymentTerm.where(user: @user).where('begin_date >= ?', Date.parse(begin_date)) if begin_date.present? && !end_date.present?

      employment_terms = EmploymentTerm.where(user: @user).where('end_date <= ?', Date.parse(end_date)) if end_date.present? && !begin_date.present?

      if begin_date.present? && end_date.present?
        employment_terms = EmploymentTerm.where(user: @user).where('begin_date >= ?', Date.parse(begin_date)).where('end_date <= ?', Date.parse(end_date))
      end
    else
      employment_terms = EmploymentTerm.where(user: @user)
    end

    @positions = employment_terms.map do |et|
      { name: et.position.position_histories.current.name, begin_date: et.begin_date, end_date: et.end_date }
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save!
      redirect_to users_path, success: 'Сотрудник добавлен'
    else
      flash.now[:danger] = 'Указаны недопустимые данные'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), success: 'Данные обновлены'
    else
      flash.now[:danger] = 'Указаны недопустимые данные'
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, success: 'Сотрудник удалён'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:l_name, :f_name, :s_name)
  end

  def employment_term_params
    params.require(:employment_term).permit(:begin_date, :end_date)
  end
end
