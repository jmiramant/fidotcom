module Refinery
  module Admin
    class AddThisController < Refinery::Admin::DialogsController
      def insert
        @add_this = AddThis.new
      end

      def append_to_wym
        @add_this = AddThis.new(params[:add_this])
        @html_for_wym = @add_this.to_html
      end

      protected

      def restrict_controller
      end

    end
  end
end
