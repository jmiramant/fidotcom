class AddThis
  include ActiveAttr::Model

  attribute :title
  attribute :description
  attribute :url
  attribute :twitter, type: Boolean, default: true
  attribute :facebook, type: Boolean, default: true
  attribute :email, type: Boolean, default: true
  attribute :pinterest, type: Boolean, default: true

  def to_html
    data_attrs = []
    attributes.each do |key, value|
      next unless value.present?
      data_attrs << "data-#{key}='#{value}'"
    end
    "<a href='#' #{data_attrs.join(" ")} data-addthis='true'>add this link</a>".html_safe
  end

end
