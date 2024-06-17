# frozen_string_literal: true

class StatusesController < ApplicationController
  def create
    @profile = Profile.find(params[:profile_id])
    @status = @profile.statuses.build(status_params)

    if @status.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'Status could not be created' }
        format.turbo_stream do
          render status: :unprocessable_entity,
                 turbo_stream: turbo_stream.update(:errors,
                                                   partial: 'shared/errors',
                                                   locals: { errors: @status.errors.full_messages })
        end
      end
    end
  end

  def destroy
    @status = Status.find(params[:id])
    @status.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end

  private

  def status_params
    params.require(:status).permit(:body)
  end
end
