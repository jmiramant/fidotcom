Refinery::Pages.configure do |config|
  config.use_view_templates = true
  config.view_template_whitelist = [
    "home",
    "show",
    "about",
    "gateway",
    "product",
    "product_slider",
    "blank",
    "badge",
    "sponsors"]

  # Configure specific page templates
  config.types.register :home do |page|
    page.parts = %w[key_image module_1 module_2 module_3 module_4]
  end

  config.types.register :product do |page|
    page.parts = %w[body illustration]
  end

  config.types.register :product_detail do |page|
    page.parts = %w[body details video]
  end

  config.types.register :sponsors do |page|
    page.parts = %w[body]
  end

  config.types.register :about do |page|
    page.parts = %w[body bottom_image]
  end

  config.use_layout_templates = true
  config.layout_template_whitelist = ["application", "no_header_or_footer"]

  # Configure global page default parts
  config.default_parts = ["Body"]

  # Configure whether to allow adding new page parts
  config.new_page_parts = true

  # Configure whether to enable marketable_urls
  # config.marketable_urls = true

  # Configure how many pages per page should be displayed when a dialog is presented that contains a links to pages
  # config.pages_per_dialog = 14

  # Configure how many pages per page should be displayed in the list of pages in the admin area
  # config.pages_per_admin_index = 20

  # Configure whether to strip diacritics from Western characters
  # config.approximate_ascii = false

  # Configure whether to strip non-ASCII characters from the friendly_id string
  # config.strip_non_ascii = false

  # Set this to true if you want to override slug which automatically gets generated
  # when you create a page
  config.use_custom_slugs = true

  # Set this to true if you want backend pages to be cached
  # config.cache_pages_backend = false

  # Set this to true to activate full-page-cache
  config.cache_pages_full = true

  # Set this to true to fully expand the page hierarchy in the admin
  config.auto_expand_admin_tree = false



  # config.page_title = {:chain_page_title=>false, :ancestors=>{:separator=>" | ", :class=>"ancestors", :tag=>"span"}, :page_title=>{:class=>nil, :tag=>nil, :wrap_if_not_chained=>false}}

  # config.absolute_page_links = false
end
