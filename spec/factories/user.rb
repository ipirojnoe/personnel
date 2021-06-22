FactoryBot.define do
  factory :user do
    l_name { "Имя_#{rand(999)}" }
    f_name { "Фамилия_#{rand(999)}" }
    s_name { "Отчество_#{rand(999)}" }
    end
end
