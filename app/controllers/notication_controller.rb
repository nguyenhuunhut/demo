class NoticationController < ApplicationController

  def delete
    @notication = Notication.find params[:id]
     if @notication.update(status: false)
    render json: {
      success: true
    }
      end
  end
end
