# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :name, :avatar, :doctor

  index do
    selectable_column
    id_column
    column 'email', :email
    column 'name', :name
    column 'doctor', :doctor

    actions
  end

  filter :title

  form(html: { multipart: true }) do |f|
    f.inputs 'User' do
      f.input :email
      f.input :name
      f.input :doctor
    end

    f.actions
  end
end
