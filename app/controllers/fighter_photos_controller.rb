class FighterPhotosController < ApplicationController
  before_action :set_fighter, only: [:create, :destroy]
  before_action :set_fighter_photo, only: [:destroy]

  # Обратите внимание: фотку может сейчас добавить даже неавторизованный пользовать
  # Смотрите домашки!
  def create
    # Создаем новую фотографию у нужного события @fighter
    @new_fighter_photo = @fighter.fighter_photos.build(fighter_photo_params)

    # Проставляем у фотографии пользователя
    @new_fighter_photo.user = current_user

    if @new_fighter_photo.save
      # Если фотка сохранилась, редиректим на событие с сообщением
      redirect_to @fighter, notice: "Добавлена фотка" #I18n.t('controllers.photos.created')
    else
      # Если нет — рендерим событие с ошибкой
      render 'fighters/show', alert: "eRRRRRoRRRRR" # I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: "DISTROYD" } #I18n.t('controllers.photos.destroyed')}

    # Проверяем, может ли пользователь удалить фотографию
    # Если может — удаляем
    if current_user_can_edit?(@fighter_photo)
      @fighter_photo.destroy
    else
      # Если нет — сообщаем ему
      message = {alert: "eRRRRRoRRRRR" } # I18n.t('controllers.photos.error')}
    end

    # В любом случае редиректим юзера на событие
    redirect_to @fighter, message
  end

  private

  # Так как фотография — вложенный ресурс, в params[:fighter_id] рельсы
  # автоматически положат id события, которому принадлежит фотография
  # Это событие будет лежать в переменной контроллера @fighter
  def set_fighter
    @fighter = Fighter.find(params[:fighter_id])
  end

  # Получаем фотографию из базы стандартным методом find
  def set_fighter_photo
    @fighter_photo = @fighter.fighter_photos.find(params[:id])
  end

  # При создании новой фотографии мы получаем массив параметров photo
  # c единственным полем photo
  def fighter_photo_params
    params.require(:fighter_photo).permit(:photo)
  end
end
