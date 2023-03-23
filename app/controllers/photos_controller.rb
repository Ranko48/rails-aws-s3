class PhotosController < ApplicationController
  before_action :set_article, only: [:create, :destroy]
  before_action :set_photo, only: [:destroy]

  # Обратите внимание: фотку может сейчас добавить даже неавторизованный пользовать
  # Смотрите домашки!
  def create
    # Создаем новую фотографию у нужного события @article
    @new_photo = @article.photos.build(photo_params)

    # Проставляем у фотографии пользователя
    @new_photo.user = current_user

    if @new_photo.save
      # Если фотка сохранилась, редиректим на событие с сообщением
      redirect_to @article, notice: "Фоточка добавлена" # I18n.t('controllers.photos.created')
    else
      # Если нет — рендерим событие с ошибкой
      render 'articles/show', alert: "Ошибочка" # I18n.t('controllers.photos.error')
    end
  end

  def destroy
    message = {notice: "Удалена"} # I18n.t('controllers.photos.destroyed')}

    # Проверяем, может ли пользователь удалить фотографию
    # Если может — удаляем
    if current_user_can_edit?(@photo)
      @photo.destroy
    else
      # Если нет — сообщаем ему
      message = {alert: I18n.t('controllers.photos.error')}
    end

    # В любом случае редиректим юзера на событие
    redirect_to @article, message
  end

  private

  # Так как фотография — вложенный ресурс, в params[:article_id] рельсы
  # автоматически положат id события, которому принадлежит фотография
  # Это событие будет лежать в переменной контроллера @article
  def set_article
    @article = Article.find(params[:article_id])
  end

  # Получаем фотографию из базы стандартным методом find
  def set_photo
    @photo = @article.photos.find(params[:id])
  end

  # При создании новой фотографии мы получаем массив параметров photo
  # c единственным полем photo
  def photo_params
    params.fetch(:photo, {}).permit(:photo)
  end
end
