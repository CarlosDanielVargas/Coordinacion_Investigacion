class Transaction < ApplicationRecord
    belongs_to :agreement
    enum status: [:Pendiente, :Finalizado, :En_Ejecución]
    validates :status, presence: true
    
    after_initialize :set_default_status, if: :new_record?

    def set_default_status
        self.status ||= :Pendiente
    end

end
