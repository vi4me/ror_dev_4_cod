ActiveAdmin.register Category do

  permit_params :title, :user_id, :appointment_id

  index do
    selectable_column
    id_column
    column "title", :title
    column "user", :user

    column "Обновлено", :updated_at
    column "Создано", :created_at
    actions
  end

  filter :title

  form(html: { multipart: true }) do |f|
    f.inputs "Category" do
      f.input :title
      f.input :user
    end

    f.actions
  end

end
