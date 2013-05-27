EverfiCom::Application.routes.draw do

  get "custom_pages/flm"

  get 'ping' => 'static#ping'
  get 'login' => redirect('https://assembly.everfi.net')

  #Legacy Urls
  get "for_customers.php" => redirect("/sponsors")
  get "contact_us.php" => redirect("/contact")
  get "careers/" => redirect("/about/careers")
  get "about_us.php" => redirect("/about")
  get "press.php" => redirect("/about/news/coverage")
  get "products.php" => redirect("/")
  get "certification.php" => redirect("/financial-educatio")
  get "for_schools.php" => redirect("/financial-education")
  get "index.php" => redirect("/")
  get "curriculum.php" => redirect("/")
  get "retention.php" => redirect("/")
  get "landing.php" => redirect("/")
  get "coupon.php" => redirect("/")
  get 'contact' => redirect('http://contact.everfi.com/contact-us-0')

  get 'ARS/agenda' => redirect('http://www.outsidetheclassroom.com/news-events/signature-events/annual-research-summit/agenda.aspx')
  get 'ARS' => redirect('http://www.outsidetheclassroom.com/news-events/signature-events/annual-research-summit.aspx')
  
  # Change first 'flm' to change where the url is.
  get 'flm' => redirect('/financialliteracymonth')
  get 'financialliteracymonth' => 'custom_pages#flm'
  get 'financialliteracymonth/schools' => 'custom_pages#flm_schools'
  get 'financialliteracymonth/highereducation' => 'custom_pages#flm_he'
  get 'financialliteracymonth/sponsors' => 'custom_pages#flm_sponsors'

  get 'jobs' => 'jobs#index'

  get "refinery/inquiries.csv" => "refinery/inquiries/admin/inquiries#to_csv",
        as: "admin_inquiries_export"

  get 'refinery/add_this/insert' => 'refinery/admin/add_this#insert'
  post 'refinery/add_this/insert' => 'refinery/admin/add_this#append_to_wym'

  get '/teacher-contact', :controller => 'Refinery::Inquiries::Inquiries', :action => 'new', :as => 'new_inquiry'

  mount Refinery::Core::Engine, :at => '/'

end
