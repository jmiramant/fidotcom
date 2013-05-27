require 'csv'
module Refinery
  module Inquiries
    module Admin
      InquiriesController.class_eval do
        def to_csv
          find_all_ham
          data = render_to_string :text => gen_csv, layout: false
          send_data data, :type => "application/csv",
                          :filename => "inquiries.csv"
        end

        protected
        def gen_csv
          attrs = @inquiries.first.attribute_names
          CSV.generate do |out|
            out << attrs
            @inquiries.each{|i| out << attrs.map{|a| i.send(a)} }
          end
        end
      end
    end
  end
end
