ActiveAdmin.register Appointment do

  permit_params :body, :closed, :category_id, :parent_id

  index do
    selectable_column
    id_column
    column "body", :body
    column "closed", :closed
    column "category_id", :category_id
    column "parent_id", :parent_id
    column "user_id", :user_id

    column "Обновлено", :updated_at
    column "Создано", :created_at
    actions
  end

  filter :title

  form(html: { multipart: true }) do |f|
    f.inputs "Appointment" do
      f.input :body
      f.input :closed
      f.input :category_id
      f.input :parent_id
      f.input :user_id
    end

    f.actions
  end

end
