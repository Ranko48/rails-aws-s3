class EventPhotosController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_event_photo, only: [:destroy]

  # Обратите внимание: фотку может сейчас добавить даже неавторизованный пользовать
  # Смотрите домашки!
  def create
    # Создаем новую фотографию у нужного события @event
    @new_event_photo = @event.event_photos.build(event_photo_params)

    # Проставляем у фотографии пользователя
    @new_event_photo.user = current_user

    if @new_event_photo.save
      # Если фотка сохранилась, редиректим на событие с сообщением
      redirect_to @event, notice: "Добавлена фотка" #I18n.t('controllers.photos.created')
    else
      # Если нет — рендерим событие с ошибкой
      render 'events/show', alert: "eRRRRRoRRRRR" # I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: "DISTROYD" } #I18n.t('controllers.photos.destroyed')}

    # Проверяем, может ли пользователь удалить фотографию
    # Если может — удаляем
    if current_user_can_edit?(@event_photo)
      @event_photo.destroy
    else
      # Если нет — сообщаем ему
      message = {alert: "eRRRRRoRRRRR" } # I18n.t('controllers.photos.error')}
    end

    # В любом случае редиректим юзера на событие
    redirect_to @event, message
  end

  private

  # Так как фотография — вложенный ресурс, в params[:event_id] рельсы
  # автоматически положат id события, которому принадлежит фотография
  # Это событие будет лежать в переменной контроллера @event
  def set_event
    @event = Event.find(params[:event_id])
  end

  # Получаем фотографию из базы стандартным методом find
  def set_event_photo
    @event_photo = @event.event_photos.find(params[:id])
  end

  # При создании новой фотографии мы получаем массив параметров photo
  # c единственным полем photo
  def event_photo_params
    params.require(:event_photo).permit(:photo)
  end
end
