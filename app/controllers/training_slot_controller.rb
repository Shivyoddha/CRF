class TrainingSlotController < ApplicationController
    def slotbooker
        @slotbooker = current_user.training_slotbooker
        @trainings = @slotbooker.constantize
    end

    def pending
        @slotbooker = current_user.training_slotbooker
        @trainings = @slotbooker.constantize
    end

    def alloted
        @slotbooker = current_user.training_slotbooker
        @trainings = @slotbooker.constantize

    end

    def completed
        @slotbooker = current_user.training_slotbooker
        @trainings = @slotbooker.constantize
    end

    def canceled
        @slotbooker = current_user.training_slotbooker
        @trainings = @slotbooker.constantize
    end
end
